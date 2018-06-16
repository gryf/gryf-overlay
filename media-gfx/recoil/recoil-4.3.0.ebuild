# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Viewer of pictures in native formats of vintage computers (Amiga, Atari, C64 and so on)"
HOMEPAGE="http://recoil.sf.net"
SRC_URI="mirror://sourceforge/project/${PN}/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/libpng"
RDEPEND="${DEPEND}"

src_install() {
	dobin recoil2png || die
	doman recoil2png.1
}
