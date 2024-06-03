# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Fork of demjson for Python 3"
HOMEPAGE="https://pypi.org/project/demjson3"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
