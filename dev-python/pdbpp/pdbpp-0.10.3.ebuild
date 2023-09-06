# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="pdb++, a drop-in replacement for pdb (the Python debugger)"
HOMEPAGE="
	https://github.com/pdbpp/pdbpp/
	https://pypi.org/project/pdbpp/
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pygments
	dev-python/fancycompleter
"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest
