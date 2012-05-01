# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2"

inherit distutils vim-doc eutils

DESCRIPTION="A debugger frontend for gvim written in python"
HOMEPAGE="http://pyclewn.wiki.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.py2.tar.gz"
#SRC_URI="http://sourceforge.net/projects/pyclewn/files/pyclewn-1.7/pyclewn-1.7.py2.tar.gz/download"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="|| ( >=app-editors/vim-7.3 >=app-editors/gvim-7.0[netbeans] )"
RDEPEND="${DEPEND}
	sys-devel/gdb"

S="${WORKDIR}/${P}.py2/"

src_prepare() {
	distutils_src_prepare
	epatch "${FILESDIR}/pyclewn_install-access-denied.patch"
}

pkg_postinst() {
	update_vim_helptags
	distutils_pkg_postinst
}
