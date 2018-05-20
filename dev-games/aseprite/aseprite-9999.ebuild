# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

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

DEPEND="dev-util/ninja
	dev-util/cmake
	x11-libs/libX11
	x11-libs/libXcursor"
RDEPEND="${DEPEND}"

src_install() {
	dobin $BUILD_DIR/bin/aseprite
	mkdir -p "${D}usr/share/aseprite/"
	cp -a $BUILD_DIR/bin/data "${D}usr/share/aseprite/"
}
