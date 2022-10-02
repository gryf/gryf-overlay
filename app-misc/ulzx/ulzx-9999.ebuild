# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Access LZX Amiga archives with Midnight Commander"
HOMEPAGE="https://github.com/gryf/mc_ulzx"
EGIT_REPO_URI="https://github.com/gryf/mc_ulzx"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	app-arch/unlzx
	app-misc/mc
	dev-python/extfslib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	echo skipping
}

src_install() {
	exeinto "/usr/libexec/mc/extfs.d/"
	doexe "${S}/ulzx"
}
