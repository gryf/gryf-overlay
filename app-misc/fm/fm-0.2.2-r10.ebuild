# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils 

DESCRIPTION="FM is simple file manager build on GTK 1.x widgets"
HOMEPAGE="http://www.uwyn.com/projects/fm/"

SRC_URI="http://www.uwyn.com/download/fm/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~alpha ~amd64 ~hppa ~ppc ~ppc64 ~sparc"
IUSE=""
DEPEND="=x11-libs/gtk+-1.2*"

src_compile() {
	emake
}

src_install() {
	dobin fm
}

