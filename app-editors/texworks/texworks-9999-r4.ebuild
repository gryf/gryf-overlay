# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

EAPI="2"

inherit eutils qt4-r2 subversion

DESCRIPTION="Environment for authoring TeX/LaTeX/ConTeXt with focus on usability"

HOMEPAGE="http://code.google.com/p/texworks"

ESVN_REPO_URI="http://texworks.googlecode.com/svn/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=">=x11-libs/qt-core-4.5.0
	app-text/poppler[qt4]
	>=app-text/hunspell-1.2.2"
RDEPEND="${DEPEND}"

#src_compile() {
#	qmake || die "TeXworks qmake failed!"
#	make || die "TeXworks make failed!"
#}

src_install() {
	dobin texworks
	insinto /usr/share/applications
	doins "${FILESDIR}"/texworks.desktop || die "Install texwork.desktop failed!"
	insinto /usr/share/pixmaps
	doins "${FILESDIR}"/icon/texworks.png || die "Install texwork icon failed!"
}
