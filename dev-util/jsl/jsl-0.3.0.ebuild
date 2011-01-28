# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Check your JavaScript source code for common mistakes."
HOMEPAGE="http://javascriptlint.com/"
SRC_URI="http://javascriptlint.com/download/${P}-src.tar.gz"
LICENSE="GPL"

IUSE=""
KEYWORDS="x86 ~amd64"
SLOT="0"

DEPEND=""
RDEPEND=""

src_compile() {
	cd "${S}/src"
	emake -j1 -f Makefile.ref|| die "Make failed"
}

src_install() {
	cd "${S}/src/Linux_All_DBG.OBJ"
	exeinto "/usr/bin"
	doexe "jsl"
}

pkg_postinst() {
	einfo
	einfo "Run jsl -help:conf to get a sample config file"
	einfo "For further information, check http://javascriptlint.com/docs/index.htm"
	einfo
}

