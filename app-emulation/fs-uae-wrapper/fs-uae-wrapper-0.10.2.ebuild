# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="Automate archives and state for fs-uae"
HOMEPAGE="https://github.com/gryf/fs-uae-wrapper"
SRC_URI="
	https://files.pythonhosted.org/packages/e9/c0/7b7a60ed297abf874cfbf492b01c2a6bd1334f11e16836c93140ab8b8cdd/fs_uae_wrapper-0.10.2.tar.gz
	-> ${P}.tar.gz
"
KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
