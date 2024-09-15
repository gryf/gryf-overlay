# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

MY_PN="adflib"

DESCRIPTION="Extract files from Amiga adf disk images"
HOMEPAGE="https://github.com/lclevy/adflib"
EGIT_REPO_URI="https://github.com/lclevy/adflib"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~x86 ~x86-linux ~ppc-macos ~sparc-solaris ~x86-solaris"
IUSE="static-libs"

#S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable static-libs static)
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}
