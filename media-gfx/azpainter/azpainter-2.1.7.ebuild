# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit gnome2-utils xdg-utils

DESCRIPTION="Full Color Paint tool"
HOMEPAGE="http://azsky2.html.xdomain.jp/"
SRC_URI="http://azsky2.html.xdomain.jp/arc/${P}.tar.xz"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libXi
	virtual/jpeg
	media-libs/libpng
	sys-libs/zlib"
RDEPEND="${DEPEND}"

src_configure() {
	./configure --prefix=${EPREFIX}/usr --docdir=/usr/share/doc/${P}
}
pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
