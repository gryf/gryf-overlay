# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Browse Reddit from your terminal"
HOMEPAGE="https://gitlab.com/ajak/tuir"
SRC_URI="https://gitlab.com/ajak/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/beautifulsoup4
	dev-python/decorator
	dev-python/kitchen
	dev-python/requests
	dev-python/six
"
RDEPEND="${DEPEND}"
BDEPEND=""
RESTRICT="test"

S=${WORKDIR}/${PN}-v${PV}
