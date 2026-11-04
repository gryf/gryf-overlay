# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Wayland compositor inspired by Window Maker"
HOMEPAGE="https://github.com/phkaeser/wlmaker"

EGIT_REPO_URI="https://github.com/phkaeser/wlmaker.git"
EGIT_COMMIT="0aec10c0bd954835984b2a75e2a492be781119aa"
EGIT_SUBMODULES=(
	"submodules/inih"
	"submodules/libbase"
)

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-libs/wayland-1.22.0
	>=dev-libs/wayland-protocols-1.32
	gui-libs/wlroots:0.20[x11-backend]
	>=x11-libs/cairo-1.16.0
	gnome-base/librsvg
	x11-libs/libxcb
	x11-libs/libxkbcommon
	dev-libs/libxdg-basedir
"
DEPEND="
	${RDEPEND}
	sys-libs/ncurses
"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dconfig_DEBUG=OFF
		-Dconfig_OPTIM=ON
		-Dconfig_WERROR=OFF
		-DIWYU_MODE=OFF
	)
	cmake_src_configure
}

