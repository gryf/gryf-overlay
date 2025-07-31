# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Browse Reddit from your terminal"
HOMEPAGE="https://gitlab.com/ajak/tuir"
SRC_URI="https://gitlab.com/ajak/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

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

PATCHES=(
	"${FILESDIR}"/${PN}-config.patch
	"${FILESDIR}"/${PN}-mailcap_fix_for_py313.patch
)

S=${WORKDIR}/${PN}-v${PV}
