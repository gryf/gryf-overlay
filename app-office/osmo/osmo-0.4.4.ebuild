# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="8"
inherit flag-o-matic

DESCRIPTION="A handy personal organizer"
HOMEPAGE="https://osmo-pim.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}-pim/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND=">=x11-libs/gtk+-2.12:2
	>=dev-libs/libtar-1.2.11-r3
	dev-libs/libxml2:2
	>=dev-libs/libical-0.33
	app-text/gtkspell:2
	>=x11-libs/libnotify-0.7"
DEPEND="${RDEPEND}
	dev-build/automake:1.16
	virtual/pkgconfig"

#PATCHES=( "${FILESDIR}/${P}-01-fix-build-without-webkit.patch"
#          "${FILESDIR}/${P}-02-fix-memory-leak.patch" )
#
src_configure() {
	append-flags -I/usr/include/libical
	econf --disable-dependency-tracking
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc AUTHORS ChangeLog README TRANSLATORS
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
