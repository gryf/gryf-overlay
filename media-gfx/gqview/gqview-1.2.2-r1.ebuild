# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-gfx/gqview/gqview-1.2.2.ebuild $

DESCRIPTION="A GTK-based image browser"
SRC_URI="mirror://sourceforge/gqview/gqview-1.2.2.tar.gz"
HOMEPAGE="http://gqview.sourceforge.net/"

SLOT="0"
KEYWORDS="x86"
src_compile() {
	econf || die
	emake || die "emake failed"
}

src_install() {
	einstall || die
}
