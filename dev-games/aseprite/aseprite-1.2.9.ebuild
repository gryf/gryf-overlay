# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils toolchain-funcs

DESCRIPTION="Animated sprite editor & pixel art tool"
HOMEPAGE="http://www.aseprite.org"
LICENSE="Proprietary"
SLOT="0"

PATCHES=( "${FILESDIR}/${P}-system_libarchive.patch" )

if [[ ${PV} = 9999* || ${PV} = *beta* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/aseprite/aseprite"
	EGIT_BRANCH="master"
	if [[ ${PV} != 9999* ]]; then
		EGIT_COMMIT="v${PV/_/-}"
	fi
else
	SRC_URI="https://github.com/${PN}/${PN}/releases/download/v${PV}/${PN^}-v${PV}-Source.zip"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}"
fi

IUSE="
	debug
	memleak
	webp
	system-allegro"

RDEPEND="
	app-arch/libarchive
	app-text/cmark
	dev-libs/tinyxml
	system-allegro? ( media-libs/allegro:0[X,png] )
	media-libs/freetype:2
	>=media-libs/giflib-5.0
	media-libs/libpng:0
	webp? ( !!media-libs/libwebp )
	net-misc/curl
	sys-libs/zlib
	virtual/jpeg:=
	x11-libs/libX11
	x11-libs/libXxf86dga
	x11-libs/pixman"
DEPEND="$RDEPEND
	app-arch/unzip"

DOCS=( EULA.txt
	docs/ase-file-specs.md
	docs/LICENSES.md
	README.md )

src_prepare() {
	cmake-utils_src_prepare

	if use system-allegro; then
		ewarn "system-allegro is enabled. It has know issues which are solved"
		ewarn "in the bundled version:"
		ewarn " * You will not be able to resize the window."
		ewarn " * You will have problems adding HSV colours on non-English systems."
	fi
}

src_configure() {
	use debug && CMAKE_BUILD_TYPE=Debug || CMAKE_BUILD_TYPE=Release

	local mycmakeargs=(
		-DENABLE_UPDATER=OFF
		-DFULLSCREEN_PLATFORM=ON
		-DBUILD_GMOCK=OFF
		-DUSE_SHARED_CMARK=ON
		-DUSE_SHARED_CURL=ON
		-DUSE_SHARED_GIFLIB=ON
		-DUSE_SHARED_JPEGLIB=ON
		-DUSE_SHARED_ZLIB=ON
		-DUSE_SHARED_LIBARCHIVE=ON
		-DUSE_SHARED_LIBPNG=ON
		-DUSE_SHARED_LIBLOADPNG=OFF # Does not exist in the main tree
		-DUSE_SHARED_TINYXML=ON
		-DUSE_SHARED_PIXMAN=ON
		-DUSE_SHARED_FREETYPE=ON
		-DUSE_SHARED_HARFBUZZ=ON
		-DUSE_SHARED_ALLEGRO4="$(usex system-allegro)"
		-DWITH_WEBP_SUPPORT="$(usex webp)"
		-DENABLE_MEMLEAK="$(usex memleak)"
	)

	cmake-utils_src_configure
}

pkg_postinst() {
	elog "Aseprite is for personal use only. You may not distribute it."
}
