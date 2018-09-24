# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils cmake-utils git-r3

DESCRIPTION="A PSP emulator written in C++."
HOMEPAGE="http://www.ppsspp.org/"
EGIT_REPO_URI="git://github.com/hrydgard/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="qt5 +sdl"
REQUIRED_USE="
	?? ( sdl )
"
#EGIT_SUBMODULES=( '*' '-ffmpeg' )
#	!libav? ( media-video/ffmpeg:= )
#	libav? ( media-video/libav:= )

RDEPEND=""

DEPEND="
	sys-libs/zlib
	sdl? (
		dev-util/cmake
		media-libs/libsdl
		media-libs/libsdl2
	)
"

src_unpack() {
	git-r3_fetch
	git-r3_checkout
}

src_prepare() {
	sed -i -e "s#-O3#-O2#g;" "${S}"/CMakeLists.txt || die
	sed -i -e "s#-O3#-O2#g;" "${S}"/ffmpeg/linux_*.sh || die
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	exeinto /usr/games
	dobin "${FILESDIR}"/ppsspp
	exeinto /usr/share/games/"${PN}"
	doexe "${WORKDIR}"/"${P}"_build/PPSSPPSDL
	insinto /usr/share/games/"${PN}"
	doins -r "${WORKDIR}"/"${P}"_build/assets

	insinto /usr/share/icons/
	newins "${WORKDIR}"/"${P}"/source_assets/image/icon_regular_72.png ppsspp-icon.png
	domenu "${FILESDIR}"/ppsspp.desktop
}

pkg_postinst() {
	elog "Remember, in order to play games, you have to "
	elog "be in the 'games' group. "
	elog "Just run 'gpasswd -a <USER> games', then have <USER> re-login. "
}
