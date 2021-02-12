# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

MY_P="eselect-emacs-${PV}"
DESCRIPTION="Manages ctags implementations"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
SRC_URI="https://dev.gentoo.org/~ulm/emacs/${MY_P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="!<app-eselect/eselect-emacs-1.18
	>=app-admin/eselect-1.2.3"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}"/${P}_add-universal-ctags.patch 
	eapply_user
}

src_install() {
	insinto /usr/share/eselect/modules
	doins {ctags,etags}.eselect
	doman {ctags,etags}.eselect.5
}
