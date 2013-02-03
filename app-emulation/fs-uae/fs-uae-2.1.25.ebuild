# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
EAPI=4

inherit games

DESCRIPTION="A multi-platform Amiga emulator"
HOMEPAGE="http://fengestad.no/fs-uae/"

# Development version of fs-uae have "dev" suffix in couple of places
SRC_URI="http://fengestad.no/${PN}/devel/${PV}dev/${P}dev.tar.gz"
S="${WORKDIR}/${P}dev"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/opengl
		media-libs/openal
		media-libs/libpng
		media-libs/libsdl
		sys-libs/zlib[minizip]"
RDEPEND="${DEPEND}"

pkg_postinst() {
	games_pkg_postinst
	ewarn "Before you launch fs-uae for the first time you need to create and configure"
	ewarn "~/.config/fs-uae/fs-uae.conf"
	ewarn "for an example see ${GAMES_DATADIR}/${PN}/example.conf"
}

