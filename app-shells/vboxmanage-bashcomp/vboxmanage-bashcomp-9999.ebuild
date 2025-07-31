# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="VBoxManage bash completion"
HOMEPAGE="https://github.com/gryf/vboxmanage-bash-completion"

if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gryf/vboxmanage-bash-completion"
	KEYWORDS="~amd64 ~x86 ~arm64 ~arm"
else
	SRC_URI="https://github.com/gryf/vboxmanage-bash-completion/archive/refs/tags/${PV}.tar.gz"
	KEYWORDS="amd64 x86 arm64 arm"
	S="${WORKDIR}/vboxmanage-bash-completion-${PV}"
fi

LICENSE="BSD"
SLOT="0"

DEPEND="app-emulation/virtualbox"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	cd ${S}
	mv VBoxManage VBoxManage_completion
	newbashcomp VBoxManage_completion VBoxManage
	bashcomp_alias VBoxManage vboxmanage
}
