# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit git-r3

DESCRIPTION="An Optimizing Hybrid LZ77 RLE Data Compression Program for 6502"
HOMEPAGE="https://github.com/mist64/pucrunch https://web.archive.org/web/http://koti.kapsi.fi/a1bert/Dev/pucrunch/"
EGIT_REPO_URI="git://github.com/mist64/pucrunch.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	dobin pucrunch
}
