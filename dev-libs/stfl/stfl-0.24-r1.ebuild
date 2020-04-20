# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit eutils multilib perl-module toolchain-funcs

DESCRIPTION="A library which implements a curses-based widget set for text terminals"
HOMEPAGE="http://www.clifford.at/stfl/"
SRC_URI="http://www.clifford.at/${PN}/${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="amd64 ppc ~ppc64 x86"
IUSE="examples static-libs"

RDEPEND="
	sys-libs/ncurses:0=[unicode]
"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	sed -i \
		-e 's/-Os -ggdb//' \
		-e 's/^\(all:.*\) example/\1/' \
		-e 's/$(CC) -shared/$(CC) $(LDFLAGS) -shared/' \
		-e 's/ -o $@ $(LDLIBS) $^/ $^ $(LDLIBS) -o $@/' \
		-e 's/-lncursesw/-lncursesw -pthread/' \
		Makefile || die "sed failed"

	if ! use static-libs ; then
		sed -i -e "/install .* libstfl.a/d" Makefile || die
	fi

	epatch "${FILESDIR}"/${PN}-0.22-soname-symlink.patch
}

src_configure() { :; }

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake prefix="/usr" DESTDIR="${D}" libdir="$(get_libdir)" install

	dodoc README

	local exdir="/usr/share/doc/${PF}/examples"
	if use examples ; then
		insinto ${exdir}
		doins example.{c,stfl}
		insinto ${exdir}/python
		doins python/example.py
		if use perl ; then
			insinto ${exdir}/perl
			doins perl5/example.pl
		fi
		if use ruby ; then
			insinto ${exdir}/ruby
			doins ruby/example.rb
		fi
	fi

	perl_delete_localpod
}
