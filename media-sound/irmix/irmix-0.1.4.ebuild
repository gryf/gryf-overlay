# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 2008/03/15 gryf $

DESCRIPTION="Lirc controled mixer with OSD display"
HOMEPAGE="http://www.blackfiveservices.co.uk/irmix.shtml"
SRC_URI="http://www.blackfiveservices.co.uk/linux_resources/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
DEPEND="( app-misc/lirc )"

src_compile() {
	# xft support is broken
	econf --disable-xft || die "configure failed"
	emake || die "make failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog TODO NEWS README
}

