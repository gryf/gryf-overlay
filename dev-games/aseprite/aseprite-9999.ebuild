# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils flag-o-matic git-r3

DESCRIPTION="Animated sprite editor & pixel art tool"
HOMEPAGE="https://www.aseprite.org"
SRC_URI=""
EGIT_REPO_URI="https://github.com/aseprite/aseprite"
CMAKE_MAKEFILE_GENERATOR="ninja"
CMAKE_BUILD_TYPE="Release"

LICENSE="https://github.com/aseprite/aseprite/blob/master/EULA.txt"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static debug kde gtk3 test +bundled-allegro webp"

DEPEND="dev-util/cmake
	dev-util/ninja
	webp? ( media-libs/libwebp )
	!static? (
		!bundled-allegro? ( media-libs/allegro:0[X,png] )
		app-text/cmark
		dev-libs/tinyxml
		media-libs/freetype
		media-libs/giflib
		media-libs/harfbuzz
		media-libs/libpng
		net-misc/curl
		sys-libs/zlib
		virtual/jpeg:0
		x11-libs/pixman
	)
	x11-libs/libX11
	x11-libs/libXcursor"
RDEPEND="${DEPEND}"

src_configure() {
	use debug && append-cppflags -DDEBUGMODE -D_DEBUG

	local mycmakeargs=()

	use !static &&
		mycmakeargs+=( 
			-DUSE_SHARED_CMARK=ON 
			-DUSE_SHARED_CURL=ON
			-DUSE_SHARED_FREETYPE=ON
			-DUSE_SHARED_GIFLIB=ON
			-DUSE_SHARED_HARFBUZZ=ON
			-DUSE_SHARED_JPEGLIB=ON
			-DUSE_SHARED_LIBPNG=ON
			-DUSE_SHARED_PIXMAN=ON
			-DUSE_SHARED_TINYXML=ON
			-DUSE_SHARED_ZLIB=ON
		)

	use !bundled-allegro && mycmakeargs+=( -DUSE_SHARED_ALLEGRO4=ON )

	mycmakeargs+=(
		-DENABLE_TESTS="$(usex test)"
		-DENABLE_UPDATER=OFF
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON
		-DWITH_DESKTOP_INTEGRATION=ON
		-DWITH_GTK_FILE_DIALOG_SUPPORT="$(usex gtk3)"
		-DWITH_QT_THUMBNAILER="$(usex kde)"
		-DWITH_WEBP_SUPPORT="$(usex webp)"
	)
	cmake-utils_src_configure
}

src_install() {
	dobin $BUILD_DIR/bin/aseprite
	mkdir -p "${D}usr/share/aseprite/"
	cp -a $BUILD_DIR/bin/data "${D}usr/share/aseprite/"
}

pkg_postinst() {
	if use !bundled-allegro; then
		ewarn "Aseprite has been built with system-wide Allegro 4."
		ewarn "Please note that you will not be able to resize the main window."
		ewarn "For resizing support enable USE-flag bundled-libs and rebuild package."
	fi
}
