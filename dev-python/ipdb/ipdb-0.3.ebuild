# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

MY_PN="ipdb"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Simple wrapper for ipython debugger set_trace()"
HOMEPAGE="http://pypi.python.org/pypi/ipdb"
SRC_URI="mirror://pypi/i/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

RDEPEND="dev-python/setuptools dev-python/ipython"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	distutils_src_compile
}
