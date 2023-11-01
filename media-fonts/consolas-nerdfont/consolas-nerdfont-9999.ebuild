# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font git-r3

DESCRIPTION="Consolas patched with Nerd Fonts"
HOMEPAGE="https://github.com/ongyx/consolas-nf"
EGIT_REPO_URI="https://github.com/ongyx/consolas-nf"
EGIT_BRANCH="master"
EGIT_SUBMODULES=()

LICENSE="Propriety"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PF}"
FONT_SUFFIX="ttf"
