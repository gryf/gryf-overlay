# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Open-source font by Johan Aakerlund"
HOMEPAGE="https://github.com/googlefonts/comfortaa"
SRC_URI="https://github.com/googlefonts/comfortaa/archive/refs/tags/${PV}.zip -> ${P}.zip"


LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/${PF}/fonts/TTF"
FONT_SUFFIX="ttf"
