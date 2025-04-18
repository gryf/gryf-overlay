# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 git-r3

DESCRIPTION="Run Linux cloud image on top of VirtualBox using commandline tool"
HOMEPAGE="https://github.com/gryf/boxpy"
EGIT_REPO_URI="https://github.com/gryf/boxpy"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-emulation/virtualbox
	dev-python/pyyaml
	dev-python/requests
	app-cdr/cdrtools
	net-misc/wget
	app-emulation/qemu
"
DEPEND="${RDEPEND}"
