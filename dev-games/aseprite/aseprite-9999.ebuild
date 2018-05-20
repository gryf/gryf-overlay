# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils git-r3

DESCRIPTION="Animated sprite editor & pixel art tool"
HOMEPAGE="https://www.aseprite.org"
SRC_URI=""
EGIT_REPO_URI="https://github.com/aseprite/aseprite"
CMAKE_MAKEFILE_GENERATOR="ninja"
CMAKE_BUILD_TYPE="Release"

LICENSE="https://github.com/aseprite/aseprite/blob/master/EULA.txt"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+bundled-libs webp"

DEPEND="dev-util/cmake
	dev-util/ninja
	webp? ( media-libs/libwebp )
	!bundled-libs? ( dev-libs/tinyxml
		media-libs/allegro:0[X,png]
		media-libs/freetype
		media-libs/giflib:=
		net-misc/curl
		sys-libs/zlib
		virtual/jpeg:0
		x11-libs/pixman
	)
	x11-libs/libX11
	x11-libs/libXcursor"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DENABLE_UPDATER=OFF
		-DUSE_SHARED_ALLEGRO4=$(usex !bundled-libs)
		-DUSE_SHARED_CURL=$(usex !bundled-libs)
		-DUSE_SHARED_FREETYPE=$(usex !bundled-libs)
		-DUSE_SHARED_GIFLIB=$(usex !bundled-libs)
		-DUSE_SHARED_JPEGLIB=$(usex !bundled-libs)
		-DUSE_SHARED_LIBLOADPNG=$(usex !bundled-libs)
		-DUSE_SHARED_LIBPNG=$(usex !bundled-libs)
		-DUSE_SHARED_PIXMAN=$(usex !bundled-libs)
		-DUSE_SHARED_TINYXML=$(usex !bundled-libs)
		-DUSE_SHARED_ZLIB=$(usex !bundled-libs)
		-DUSE_SHARED_LIBWEBP=$(usex !bundled-libs)
		-DWITH_WEBP_SUPPORT="$(usex webp)"
	)
	cmake-utils_src_configure
}

src_install() {
	dobin $BUILD_DIR/bin/aseprite
	mkdir -p "${D}usr/share/aseprite/"
	cp -a $BUILD_DIR/bin/data "${D}usr/share/aseprite/"
}
