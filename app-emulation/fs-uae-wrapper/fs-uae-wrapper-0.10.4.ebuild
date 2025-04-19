# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Automate archives and state for fs-uae"
HOMEPAGE="https://github.com/gryf/fs-uae-wrapper"

if [[ ${PV} == *9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gryf/fs-uae-wrapper"
	EGIT_BRANCH="master"
else
	SRC_URI="
	https://github.com/gryf/fs-uae-wrapper/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz
	"
	KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
fi

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
