# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Midnight Commander extfs for several filetypes using Python"
HOMEPAGE="https://github.com/gryf/mc_extfslib"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="test"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""
