# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/lockrun/lockrun-2.ebuild,v 1.7 2010/08/11 01:00:23 jer Exp $

inherit toolchain-funcs

DESCRIPTION="A display resolution changer for the Window Maker menu"
HOMEPAGE="?"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="amd64 hppa x86"
IUSE=""

RESTRICT="test"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_unpack() {
	cp "${FILESDIR}"/wmres.c "${S}"/wmres.c
	cp -f "${FILESDIR}"/Makefile "${S}" || die

	sed -i '/#include <stdio.h>/a\
#include <stdlib.h>' "${S}"/wmres.c

	tc-export CC
}

src_install () {
	dobin ${PN} || die
}
