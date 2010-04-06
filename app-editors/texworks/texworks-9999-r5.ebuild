# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

EAPI="2"

inherit eutils qt4 subversion

DESCRIPTION="Environment for authoring TeX/LaTeX/ConTeXt with focus on usability"
HOMEPAGE="http://code.google.com/p/texworks"
ESVN_REPO_URI="http://texworks.googlecode.com/svn/trunk/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

LANGS="ar ca cs de es fa fr it ja ko nl pl pt_BR ru sl tr zh_CN"
for LNG in ${LANGS}; do
	IUSE="${IUSE} linguas_${LNG}"
done

DEPEND=">=x11-libs/qt-core-4.5.0
	app-text/poppler[qt4]
	>=app-text/hunspell-1.2.2"

RDEPEND=">=x11-libs/qt-core-4.5.2
		 >=x11-libs/qt-gui-4.5.2[dbus]
		 >=app-text/poppler-0.12.3-r3[qt4]
		 >=app-text/hunspell-1.2.8"
RDEPEND="${DEPEND}"
PDEPEND="latex? ( dev-texlive/texlive-latex ) !latex? ( app-text/texlive-core )"

src_prepare() {
	# disable guessing path to tex binary, we already know it
	sed -i '\:system(./getDefaultBinPaths.sh): d' TeXworks.pro || die
	echo '#define DEFAULT_BIN_PATHS "/usr/bin"' > src/DefaultBinaryPaths.h || die

	sed -i '/TW_HELPPATH/ s:/usr/local:/usr:' TeXworks.pro || die
	sed -i '/TW_DICPATH/ s:/myspell/dicts:/myspell:' TeXworks.pro || die
}

src_compile() {
	eqmake4 TeXworks.pro
	emake || die "emake failed"
}

src_install() {
	dobin ${PN} || die

	# install translations
	insinto /usr/share/${PN}/
	for LNG in ${LANGS}; do
		if use linguas_${LNG}; then
			doins trans/TeXworks_${LNG}.qm || die
		fi
	done
}

