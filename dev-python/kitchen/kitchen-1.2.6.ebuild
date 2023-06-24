# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Useful snippets of python code"
HOMEPAGE="
	https://web.archive.org/web/20150926033708/https://fedorahosted.org/kitchen/
	https://github.com/fedora-infra/kitchen
	https://pypi.org/project/kitchen/
"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="test"

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose
	)
"
