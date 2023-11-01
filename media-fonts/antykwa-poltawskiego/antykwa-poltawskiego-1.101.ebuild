# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Antykwa Poltawskiego otf font"
HOMEPAGE="https://jmn.pl/antykwa-poltawskiego https://www.gust.org.pl/projects/e-foundry/poltawski/download/index_html"
SRC_URI="https://www.gust.org.pl/projects/e-foundry/poltawski/download/ap${PV}otf.zip"

LICENSE="GFL"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

S="${WORKDIR}"
FONT_SUFFIX="otf"
