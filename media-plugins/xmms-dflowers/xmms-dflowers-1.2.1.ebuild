# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-dflowers/xmms-dflowers-1.2.1.ebuild,v 1.16 2006/05/23 19:22:51 corsair Exp $

inherit eutils

IUSE=""

MY_P=${PN/xmms-/}-v${PV}
S=${WORKDIR}/${MY_P}
DESCRIPTION="Dual Flowers visualization plugin for xmms"
HOMEPAGE="http://www.shell.linux.se/bm/index.php?page=xmmsplugin"
SRC_URI="http://www.shell.linux.se/bm/f/${MY_P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="amd64 ppc ppc64 sparc x86"

DEPEND=">=sys-apps/portage-2.0.47-r10
	media-sound/xmms"

src_unpack() {
	unpack ${A}
	cd ${S} || die
	# patch in DESTDIR support
	epatch ${FILESDIR}/${MY_P}-destdir.patch
}

src_compile() {
	# There is no configure script, but the
	# Makefile does things (mostly) correctly.
	make clean || die
	emake OPT="$CFLAGS" || die
}

src_install() {
	make DESTDIR=${D} install || die
	dodoc README Changes
}

pkg_postinst() {
	einfo "Don't forget to set the skin, plugin might look weird otherwise!"
}
