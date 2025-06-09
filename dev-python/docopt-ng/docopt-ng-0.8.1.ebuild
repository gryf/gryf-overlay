# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="Fork of docopt with maintenance, typehints, and complete test coverage."
HOMEPAGE="
	https://pypi.org/project/docopt-ng/
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
