# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit git-r3
inherit distutils-r1

DESCRIPTION="Simple python script to control Linak desks and USB2LIN06 cable."
HOMEPAGE="https://github.com/gryf/linak-ctrl"
EGIT_REPO_URI="https://github.com/gryf/linak-ctrl"
EGIT_BRANCH="master"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/pyusb"
DEPEND="${RDEPEND}"
