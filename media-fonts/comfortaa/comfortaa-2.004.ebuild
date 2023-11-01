# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Open-source font by Johan Aakerlund"
HOMEPAGE="https://github.com/googlefonts/comfortaa"
SRC_URI="https://github.com/googlefonts/comfortaa/archive/refs/tags/3.101.zip -> ${P}.zip"


LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}/${PN}-3.101/old/version-2.004/fonts/"
FONT_SUFFIX="ttf"
