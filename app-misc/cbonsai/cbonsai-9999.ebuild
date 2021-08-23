# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Grow bonsai trees in your terminal"
HOMEPAGE="https://gitlab.com/jallbrit/cbonsai"
EGIT_REPO_URI="https://gitlab.com/jallbrit/cbonsai.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sh ~sparc ~x86"

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin cbonsai
}
