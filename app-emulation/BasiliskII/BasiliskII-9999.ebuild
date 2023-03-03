# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Open Source 68k Macintosh emulator"
HOMEPAGE="https://sheepshaver.cebix.net"
EGIT_REPO_URI="https://github.com/cebix/macemu"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+jit -network"

DEPEND="x11-libs/gtk+:2
	media-libs/libsdl2
	network? ( net-misc/vde )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}/${PN}/src/Unix"

src_prepare() {
	default
	./autogen.sh \
		--with-sdl2 \
		$(use_enable jit jit-compiler) \
		$(use_with network vdeplug) || die
}

src_configure() {
	econf \
		--with-sdl2 \
		$(use_enable jit jit-compiler) \
		$(use_with network vdeplug)
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc ../../README
	dodoc ../../TECH
	dodoc ../../TODO
}
