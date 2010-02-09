# Copyright 1999-2003 Gentoo Technologies, Inc.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

RESTRICT="nomirror"

S=${WORKDIR}/${P}
DESCRIPTION="Kydpdict is a graphical frontend to Collins', PWN Oxford & SAP dictionaries."
SRC_URI="http://members.elysium.pl/ytm/src/$P.tar.bz2"
HOMEPAGE="http://members.elysium.pl/ytm/html/kydpdict.html"
KEYWORDS="x86"
SLOT="0"
LICENSE="GPL-2"

src_compile(){
	local myconf
	myconf="$myconf  --with-x --datadir=/usr/share"
	econf ${myconf} || die "econf failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

pkg_postinst(){
	echo
	elog "This is only a front-end to dictionaries."
	elog "You need to have windows version installed. In fact you need only four files:"
	elog "dict100.dat, dict101.dat, dict100.idx, dict101.idx"
	elog "angpol.win polang.win"
	echo
}
