# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-video/nvclock/nvclock-0.8_beta2.ebuild,v 1.4 2008/06/04 18:36:44 flameeyes Exp $

inherit eutils autotools

MY_P="${PN}${PV/_beta/b}"
S=${WORKDIR}/${MY_P}
DESCRIPTION="NVIDIA Overclocking Utility"
HOMEPAGE="http://www.linuxhardware.org/nvclock/"
SRC_URI="http://www.linuxhardware.org/nvclock/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~amd64"
IUSE="gtk"

RDEPEND="virtual/libc
	gtk? ( =x11-libs/gtk+-2* )"

src_compile() {
	econf $(use_enable gtk) || die "Error: econf failed."
	emake || die "Error: emake failed."
}

src_install() {
	dodir /usr/bin
	einstall || die
	newinitd "${FILESDIR}"/nvclock_initd nvclock
	newconfd "${FILESDIR}"/nvclock_confd nvclock
}

pkg_postinst() {
	elog "To enable card overclocking at startup, edit your /etc/conf.d/nvclock"
	elog "accordingly and then run: rc-update add nvclock default"
}
