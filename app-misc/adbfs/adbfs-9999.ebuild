# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit git-r3

DESCRIPTION="Access your Android device filesystem from Midnight Commander through adb"
HOMEPAGE="https://github.com/gryf/mc_adbfs"
EGIT_REPO_URI="https://github.com/gryf/mc_adbfs"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-util/android-tools
	app-misc/mc
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	eapply_user
}

src_compile() {
	einfo "Skipping calling make, as it has other purpose."
}

src_install() {
	exeinto "/usr/libexec/mc/extfs.d/"
	doexe "${S}/adbfs"
}
