# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A tool to draw and convert C64 hires bitmap graphics."
HOMEPAGE="http://sourceforge.net/projects/hermires/"
MY_P="HermIRES-${PV}"
SRC_URI="mirror://sourceforge/hermires/${MY_P}.zip"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/allegro"
RDEPEND="${DEPEND}"
