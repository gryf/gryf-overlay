# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="tiny svg2pdf convert tool"
HOMEPAGE="http://cairographics.org"
SRC_URI="http://cairographics.org/snapshots/${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="media-fonts/corefonts \
x11-libs/cairo
>=x11-libs/libsvg-cairo-0.1.6"

src_install() {
	cd src/
	dobin svg2pdf || die "Could not install binary."
}
