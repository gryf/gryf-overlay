# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/unadf/unadf-0.7.9b.ebuild,v 1.11 2010/01/01 19:41:00 fauli Exp $

inherit eutils

DESCRIPTION="Extract files from Amiga adf disk images"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/u/unadf/unadf_0.7.11a.orig.tar.gz"
HOMEPAGE="http://packages.debian.org/unstable/utils/unadf"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="app-arch/unzip
		x11-misc/makedepend"
RDEPEND=""

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}"/source-code-fixes
	epatch "${FILESDIR}"/64-bit-fixes
	epatch "${FILESDIR}"/add-hardening-flags-in-compiler-options
	epatch "${FILESDIR}"/unadf_separate_comment.patch
}

src_compile() {
	echo "** ${S} **"
	cd "${S}" && make || die "make failed"
}

src_install() {
	dobin Demo/unadf
	dodoc README CHANGES Faq/adf_info.txt
	docinto Docs
	dodoc Docs/*
	docinto Faq
	dodoc Faq/*
	docinto Faq/image
	dodoc Faq/image/*
}
