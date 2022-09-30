# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3

DESCRIPTION="Run Ubuntu or Fedora cloud image on top of VirtualBox using commandline tool"
HOMEPAGE="https://github.com/gryf/boxpy"
EGIT_REPO_URI="https://github.com/gryf/boxpy"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyyaml
	dev-python/requests
	app-cdr/cdrtools
	net-misc/wget
	app-emulation/qemu
"
DEPEND="${RDEPEND}"

src_install() {
	newbin box.py boxpy
}
