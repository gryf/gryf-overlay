# Copyright 1999-2017 Gentoo Foundation
# Copyright 2017-2019 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

# NOTICE: ebuild is not finished, but basic features should work

EAPI=7
inherit rindeal

## git-hosting.eclass:
GH_RN="github"

## python-*.eclass:
PYTHON_COMPAT=( python3_{5,6,7} )

## EXPORT_FUNCTIONS: src_unpack
inherit git-hosting

## EXPORT_FUNCTIONS: src_prepare src_configure src_compile src_test src_install
## variables: PYTHON_USEDEP
inherit distutils-r1

## functions: optfeature
inherit eutils

DESCRIPTION="Python-powered, cross-platform, Unix-gazing shell"
HOMEPAGE_A=(
	"https://xonsh.readthedocs.org/"
	"${GH_HOMEPAGE}"
)
LICENSE="BSD"

SLOT="0"

KEYWORDS="~amd64 ~arm ~arm64"
IUSE_A=( )

CDEPEND_A=(
	"dev-python/ply[${PYTHON_USEDEP}]"
	"dev-python/pygments[${PYTHON_USEDEP}]"
)
DEPEND_A=( "${CDEPEND_A[@]}"
	# setup.py is not using 'console_scripts' so no runtime dep on setuptools
	"dev-python/setuptools[${PYTHON_USEDEP}]"
)
RDEPEND_A=( "${CDEPEND_A[@]}" )

inherit arrays

pkg_postinst() {
	elog "Optional features"
	optfeature "Jupyter kernel support" dev-python/jupyter
	optfeature "Alternative to readline backend" dev-python/prompt_toolkit
}
