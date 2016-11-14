# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Suite of packer/depacker tools for 6510 processor"
HOMEPAGE="https://bitbucket.org/magli143/exomizer/wiki/Home"
SRC_URI="https://bitbucket.org/magli143/exomizer/wiki/downloads/${PN}${PV//./}.zip"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_prepare() {
	 sed -i -e 's/^WFLAGS/#WFLAGS/' src/Makefile || die "Sed failed!"
	 sed -i -e 's/^CFLAGS/#CFLAGS/' src/Makefile || die "Sed failed!"
	 sed -i -e 's/^LDFLAGS/#LDFLAGS/' src/Makefile || die "Sed failed!"
	 eapply_user
}

src_compile() {
	cd ${S}/src
	emake || die "Make failed!"
}


src_install() {
	dobin src/exomizer src/exoraw src/exobasic
}
