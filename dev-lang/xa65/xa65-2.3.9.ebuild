# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Two-pass cross-assembler for MOS 6502 and compatible CPUs"
HOMEPAGE="http://www.floodgap.com/retrotech/xa/"
SRC_URI="http://www.floodgap.com/retrotech/xa/dists/xa-$PV.tar.gz"

LICENSE="GPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	unpack ${A}
	mv "${WORKDIR}/xa-$PV" "${WORKDIR}/${P}"
}

src_install() {
	emake -j1 PREFIX="${EPREFIX}" DESTDIR="${D}/usr" install || die
}
