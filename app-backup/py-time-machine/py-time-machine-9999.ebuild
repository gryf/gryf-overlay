# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..13} )

inherit git-r3

DESCRIPTION="Rsync/hardlinks based python script for backup purposes"
HOMEPAGE="https://github.com/gryf/py-time-machine"
EGIT_REPO_URI="https://github.com/gryf/py-time-machine"
EGIT_BRANCH="master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pyyaml
	net-misc/rsync
"
DEPEND="${RDEPEND}"

src_install() {
	newbin  py-time-machine.py py-time-machine
	einstalldocs
}
