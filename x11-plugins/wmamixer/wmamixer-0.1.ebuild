# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit eutils

DESCRIPTION="Real ALSA mixer dockapp for Window Maker"
HOMEPAGE="http://github.com/gryf/wmamixer"
SRC_URI="https://github.com/gryf/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="x11-libs/libXext
	x11-libs/libXpm
	x11-libs/libX11"
DEPEND="${RDEPEND}"

src_install() {
	dobin ${PN}
	dodoc README CHANGES
}

