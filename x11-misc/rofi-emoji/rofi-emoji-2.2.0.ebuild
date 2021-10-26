# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit autotools git-r3

DESCRIPTION="Emoji selector plugin for Rofi "
HOMEPAGE="https://github.com/Mange/rofi-emoji"
EGIT_REPO_URI="https://github.com/Mange/rofi-emoji"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+clipboard primary wayland +X"

DEPEND="x11-misc/rofi"
RDEPEND="${DEPEND}
	X? ( || ( x11-misc/xsel x11-misc/xclip ) )
	wayland? ( gui-apps/wl-clipboard )"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/${P}-primary.patch
)

src_prepare() {
	default
	if ! use primary; then
		sed -ie '/handle_primary "$tool"/d' clipboard-adapter.sh || die
	fi
	if ! use clipboard; then
		sed -ie '/handle_copy "$tool"/d' clipboard-adapter.sh || die
	fi
	eautoreconf
}
