# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Access ADF/DMS Amiga disk images with Midnight Commander"
HOMEPAGE="https://github.com/gryf/mc_uadf"
EGIT_REPO_URI="https://github.com/gryf/mc_uadf"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

IUSE="dms"

DEPEND="
	dms? ( app-arch/xdms )
	app-arch/unadf
	app-misc/mc
	dev-python/extfslib
"
RDEPEND="${DEPEND}"
BDEPEND=""


src_install() {
	exeinto "/usr/libexec/mc/extfs.d/"
	doexe "${S}/uadf"
}
