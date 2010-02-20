# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A simple to use EPUB and MobiPocket ebook creator"
HOMEPAGE="http://www.juliansmart.com/ecub"
SRC_URI="x86? ( http://www.anthemion.co.uk/ecub/ecub_${PV}-1_i386.deb )
amd64? ( http://www.anthemion.co.uk/ecub/ecub_${PV}-1_amd64.deb )"

# LICENSE="eCub"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="app-arch/deb2targz"
RDEPEND=""

src_unpack() {
	ARCH_SUFFIX=""
	if use x86 ; then
		ARCH_SUFFIX="i386"
	fi
	if use amd64 ; then
		ARCH_SUFFIX="amd64"
	fi
	DEBFILE="ecub_${PV}-1_${ARCH_SUFFIX}.deb"
	TGZFILE="ecub_${PV}-1_${ARCH_SUFFIX}.tar.gz"
	cd ${WORKDIR}
	ln -s ${DISTDIR}/${DEBFILE} .
	deb2targz ${DEBFILE}
	tar xzf ${TGZFILE}
	rm ${DEBFILE}
}

src_compile() {
	true
}

src_install() {
	dodir /usr/bin
	dodir /usr/share
	dodir /usr/share/applications
	dodir /usr/share/pixmaps
	cd ${WORKDIR}
	cp -R "usr/share/ecub" "${D}usr/share/" || die
	dosym /usr/share/ecub/ecub /usr/bin/ecub
	insinto /usr/share/pixmaps
	newins usr/share/ecub/appicons/ecub48x48.png ecub.png
	insinto /usr/share/applications
	doins usr/share/ecub/ecub.desktop
}

