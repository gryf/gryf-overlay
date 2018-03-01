# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit qmake-utils gnome2-utils

DESCRIPTION="Sophisticated screen shot utility"
HOMEPAGE="https://github.com/lupoDharkael/flameshot"
SRC_URI="https://github.com/lupoDharkael/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtwidgets:5
	dev-qt/qtgui:5
	dev-qt/qtdbus:5
	dev-qt/qtnetwork:5
	dev-qt/qtopengl:5
	dev-qt/qtprintsupport:5
	dev-qt/qtdeclarative:5
	dev-qt/qtsql:5
	dev-qt/qtsvg:5
	dev-qt/qttest:5
	dev-qt/qtxml:5
	dev-qt/qtxmlpatterns:5"
DEPEND="${RDEPEND}"

src_configure() {
	mkdir ${D}usr
	eqmake5 PREFIX="${D}usr"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
