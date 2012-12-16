# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

DESCRIPTION="a multi-platform Amiga emulator"
HOMEPAGE="http://fengestad.no/fs-uae/"
SRC_URI="http://fengestad.no/${PN}/stable/${PV}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/opengl
		media-libs/openal
		media-libs/libpng
		media-libs/libsdl
		sys-libs/zlib[minizip]"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-remove_fadeout.patch
}

pkg_postinst() {
	games_pkg_postinst
	ewarn "Before you launch fs-uae for the first time you need to create and configure"
	ewarn "~/.config/fs-uae/fs-uae.conf"
	ewarn "for an example see ${GAMES_DATADIR}/${PN}/example.conf"
}

