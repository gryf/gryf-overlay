# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..13} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Emoji, unicode and general character picker for rofi and rofi-likes"
HOMEPAGE="https://github.com/fdw/rofimoji"
SRC_URI="https://github.com/fdw/rofimoji/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	|| ( x11-misc/rofi x11-misc/rofi-wayland )
	<dev-python/ConfigArgParse-2.0.0[${PYTHON_USEDEP}]
"
RDEPEND=""
BDEPEND=""

src_install() {
	distutils-r1_src_install
	doman src/picker/docs/rofimoji.1
}
