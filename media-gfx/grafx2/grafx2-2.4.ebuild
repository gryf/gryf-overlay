# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit vcs-snapshot

DESCRIPTION="A pixelart-oriented painting program"
HOMEPAGE="http://pulkomandy.tk/projects/GrafX2"
SRC_URI="https://gitlab.com/GrafX2/${PN}/repository/archive.tar.gz?ref=v${PV} -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ttf lua"

DEPEND="media-libs/libsdl
	media-libs/sdl-image
	media-libs/freetype
	media-libs/libpng
	ttf? ( media-libs/sdl-ttf )
	lua? ( >=dev-lang/lua-5.1.0 )"
RDEPEND=""

src_unpack() {
	vcs-snapshot_src_unpack
}

src_compile() {
	use ttf || MYCNF="NOTTF=1"
	use lua || MYCNF="${MYCNF} NOLUA=1"
	cd ${WORKDIR}/${P}/src/
	emake ${MYCNF} || die "emake failed"
}

src_install() {
	cd ${WORKDIR}/${P}/src/
	emake DESTDIR="${D}" PREFIX="/usr" install || die "Install failed"
}

pkg_postinst() {
	elog "Please report bugs upstream:"
	elog "http://pulkomandy.tk/projects/GrafX2"
}
