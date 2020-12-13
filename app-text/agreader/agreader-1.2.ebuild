# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/unadf/unadf-0.7.9b.ebuild,v 1.11 2010/01/01 19:41:00 fauli Exp $

inherit eutils

DESCRIPTION="Read AmigaGuide hybertext documents on console"
SRC_URI="http://aminet.net/misc/unix/AGReader.tar.bz2"
HOMEPAGE="http://aminet.net/package/misc/unix/AGReader"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND=""
RDEPEND=""

src_compile() {
	cd "${WORKDIR}"/AGReader/Sources && make || die "make failed"
}

src_install() {
	dobin "${WORKDIR}"/AGReader/Sources/agr
	dodoc "${WORKDIR}"/AGReader/Docs/*
}
