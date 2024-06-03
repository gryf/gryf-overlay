# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

PYTHON_COMPAT=( python3_{9..13} )
inherit distutils-r1 pypi

DESCRIPTION="Python REPL build on top of prompt_toolkit"
HOMEPAGE="https://github.com/prompt-toolkit/ptpython"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-black -ipython"

RDEPEND="
	black? (
		dev-python/black[${PYTHON_USEDEP}]
	)
	dev-python/appdirs[${PYTHON_USEDEP}]
	ipython? (
		dev-python/ipython[${PYTHON_USEDEP}]
	)
	>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0.18[${PYTHON_USEDEP}]
	<dev-python/prompt_toolkit-3.1.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install
	if ! use ipython; then
		rm "${D}"/usr/bin/ptipython* || die
	fi
}
