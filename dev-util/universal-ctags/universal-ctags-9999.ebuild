# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools git-r3

DESCRIPTION="A maintained ctags implementation"
HOMEPAGE="https://ctags.io"
EGIT_REPO_URI="https://github.com/universal-ctags/ctags"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="app-eselect/eselect-ctags"

src_prepare() {
	[[ ${PV} == "9999" ]] && ./autogen.sh
	eautoreconf
}

src_configure() {
	econf \
		--disable-readlib \
		--disable-etags \
		--program-prefix=universal- \
		--enable-tmpdir=/tmp
}

pkg_postinst() {
	eselect ctags update
	elog "You can set the version to be started by /usr/bin/ctags through"
	elog "the ctags eselect module. \"man ctags.eselect\" for details."
}

pkg_postrm() {
	eselect ctags update
}
