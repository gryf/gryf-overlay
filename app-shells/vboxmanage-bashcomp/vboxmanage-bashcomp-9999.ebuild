# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 bash-completion-r1

DESCRIPTION="VBoxManage bash completion"
HOMEPAGE="https://github.com/gryf/vboxmanage-bash-completion"
EGIT_REPO_URI="https://github.com/gryf/vboxmanage-bash-completion"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="app-emulation/virtualbox"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cd ${S}
	mv VBoxManage VBoxManage_completion
	newbashcomp VBoxManage_completion VBoxManage
	bashcomp_alias VBoxManage vboxmanage
}
