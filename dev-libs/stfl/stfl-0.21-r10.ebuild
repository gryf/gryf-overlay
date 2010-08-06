# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# Fixed to compile with python2. Python3 is crashing. gryf.
# $Header: $

EAPI="2"
inherit eutils multilib perl-module python toolchain-funcs

DESCRIPTION="A library which implements a curses-based widget set for text terminals"
HOMEPAGE="http://www.clifford.at/stfl/"
SRC_URI="http://www.clifford.at/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc x86"

IUSE="perl python ruby"

COMMON_DEPEND="sys-libs/ncurses[unicode]
	perl? ( dev-lang/perl )
	ruby? ( dev-lang/ruby )
	python? ( dev-lang/python )"

DEPEND="${COMMON_DEPEND}
	perl? ( dev-lang/swig )
	ruby? ( dev-lang/swig )"

RDEPEND="${COMMON_DEPEND}"

RESTRICT_PYTHON_ABIS="2.*"
PYTHON_DEPEND="2"


src_prepare() {
	sed -i \
		-e "s!-Os -ggdb!!" \
		-e "s!^\(all:.*\) example!\1!" \
		Makefile

	epatch "${FILESDIR}/${P}-multilib.patch"

	if ! use perl; then
		echo "FOUND_PERL5=0" >>Makefile.cfg
	fi

	if ! use ruby; then
		echo "FOUND_RUBY=0" >>Makefile.cfg
	fi

	if ! use python; then
		echo "FOUND_PYTHON=0" >>Makefile.cfg
	fi
}

src_compile() {
	emake CC="$(tc-getCC)" || die "make failed"
}

src_install() {
	emake prefix="/usr" DESTDIR="${D}" libdir="$(get_libdir)" install || die "make install failed"
	dodoc README
	fixlocalpod
}

pkg_postinst() {
	python_mod_optimize $(python_get_sitedir)/stfl.py
}

pkg_postrm() {
	python_mod_cleanup
}
