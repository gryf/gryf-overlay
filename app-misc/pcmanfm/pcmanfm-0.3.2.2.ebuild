# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils 

DESCRIPTION="Pcmanfm is simple yet powerfull file manager"
HOMEPAGE="http://pcmanfm.sourceforge.net"
SRC_URI="http://downloads.sourceforge.net/pcmanfm/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc"
IUSE=""
DEPEND="=x11-libs/gtk+-2*
	sys-apps/hal
	app-admin/gamin
	sys-apps/dbus"

src_compile() {
	econf || die
	emake || die
}

src_install() {
	emake DESTDIR=${D} install || die
}

