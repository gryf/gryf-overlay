# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Midnight Commander extfs plugin for handling pycatalog databases."
HOMEPAGE="https://github.com/gryf/mc_pycatalog"
EGIT_REPO_URI="https://github.com/gryf/mc_pycatalog"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

IUSE="dms"

DEPEND="
	app-misc/mc
	app-misc/pycatalog
	dev-python/extfslib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	exeinto "/usr/libexec/mc/extfs.d/"
	doexe "${S}/upycatalog"
}
