# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_11 )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="A slugifier that works in unicode"
HOMEPAGE="https://pypi.org/project/unicode-slugify"

LICENSE="BSD" # "BSD-3 Clause"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/unidecode
	dev-python/six
"
