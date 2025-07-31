# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit git-r3
inherit distutils-r1

DESCRIPTION="Parse and generate html out of vimwiki source files"
HOMEPAGE="https://github.com/gryf/vimwiki2html"
EGIT_REPO_URI="https://github.com/gryf/vimwiki2html"
EGIT_BRANCH="master"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

RDEPEND=""
DEPEND="${RDEPEND}"
