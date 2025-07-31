# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit git-r3
inherit distutils-r1

DESCRIPTION="TUI application for querying StarDict dictionaries."
HOMEPAGE="https://github.com/gryf/sdpy"
EGIT_REPO_URI="https://github.com/gryf/sdpy"
EGIT_BRANCH="master"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

RDEPEND="
	dev-python/urwid
	dev-python/pystardict
	dev-python/rapidfuzz
"
DEPEND="${RDEPEND}"
