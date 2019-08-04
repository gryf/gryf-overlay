# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop git-r3

DESCRIPTION="Commodore 64 and Atari XL/XE debugger that works in real time."
HOMEPAGE="https://sourceforge.net/projects/c64-debugger"
EGIT_REPO_URI="https://git.code.sf.net/p/c64-debugger/code"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	media-libs/mesa
	x11-libs/gtk+:3
	media-libs/alsa-lib
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	cd "${WORKDIR}/${PN}-${PV%_*}/MTEngine"
	# remove binary compression with upx
	sed -i '/upx -9 c64debugger/d' Makefile
	make
}

src_install() {
	cd "${WORKDIR}/${PN}-${PV%_*}/MTEngine"
	dobin c64debugger
	cp "Assets/icons C64 Debugger/Images.xcassets/IconPRG.iconset/icon_128x128.png" c64debugger.png
	doicon c64debugger.png
}
