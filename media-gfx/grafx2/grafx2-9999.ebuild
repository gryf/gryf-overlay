# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

RECOIL_P="recoil-4.3.2"

DESCRIPTION="Bitmap paint program inspired by Deluxe Paint and Brilliance"
HOMEPAGE="http://grafx2.chez.com/"
SRC_URI="mirror://sourceforge/recoil/${RECOIL_P}.tar.gz"
EGIT_REPO_URI="https://gitlab.com/GrafX2/grafX2.git/"

LICENSE="GNU GPL v2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="lua truetype"

DEPEND=">=media-libs/libsdl-1.2
	>=sys-devel/make-3.80
	>=media-libs/sdl-image-1.2
	>=media-libs/libpng-1.4
	truetype? ( media-libs/sdl-ttf )
	lua? ( >=dev-lang/lua-5.1 )"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	default
	mv "${WORKDIR}"/${RECOIL_P} "${S}/3rdparty"
}

src_compile() {
	cd src
	make || die
}

src_install() {
	make DESTDIR="${D}" install || die
	dodoc doc/*
	dobin bin/grafx2-sdl

	insinto /usr/share/${PN}/fonts
	doins share/grafx2/fonts/*.{png,gif,ttf}

	if use lua; then
		insinto /usr/share/${PN}/scripts
		doins share/grafx2/scripts/*.lua
		for dn in brush demo libs palette picture; do
			insinto /usr/share/${PN}/scripts/samples_2.4/${dn}
			doins share/grafx2/scripts/samples_2.4/${dn}/*.lua
		done
		insinto /usr/share/${PN}/scripts/samples_2.4/demo/brush
		doins share/grafx2/scripts/samples_2.4/demo/brush/*.lua
	fi

	insinto /usr/share/${PN}/skins
	doins share/grafx2/skins/*.{png,gif}
	insinto /usr/share/${PN}
	doins share/grafx2/*.{png,gif,ini}

}
