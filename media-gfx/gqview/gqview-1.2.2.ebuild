# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/gqview/gqview-1.2.2.ebuild $

IUSE="nls"

DESCRIPTION="A GTK-based image browser"
SRC_URI="mirror://sourceforge/gqview/${P}.tar.gz"
HOMEPAGE="http://gqview.sourceforge.net/"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ppc sparc amd64"

DEPEND="media-libs/libpng
	>=x11-libs/gtk+-1.2.10"

RDEPEND="nls? ( sys-devel/gettext )"

src_compile() {
	econf `use_enable nls` || die
	emake || die "emake failed"
}

src_install() {
	einstall GNOME_DATADIR=${D}/usr/share || die

	# Don't remove duplicate README, the program looks for it. (bug 30111)
	# rm -rf ${D}/usr/share/gqview
	dodoc AUTHORS ChangeLog README TODO || die "dodoc failed"
}
