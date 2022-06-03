# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit git-r3
inherit distutils-r1

DESCRIPTION="Library for building Window Maker dockapps"
HOMEPAGE="https://github.com/gryf/wmtemp"
EGIT_REPO_URI="https://github.com/gryf/wmdocklib"
EGIT_BRANCH="master"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~ia64 ppc ppc64 ~riscv ~s390 ~sparc x86 ~amd64-linux ~x86-linux"

RDEPEND="
	>=x11-libs/libX11-1.7.5
	>=x11-libs/libXext-1.3.4
	>=x11-libs/libXpm-3.5.13
"
DEPEND="${RDEPEND}"

distutils_enable_tests unittest
