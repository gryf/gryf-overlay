# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Perl extensions for rxvt-unicode"
HOMEPAGE="https://github.com/gryf/urxvt-perls"
EGIT_REPO_URI="https://github.com/gryf/urxvt-perls"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

RDEPEND="x11-misc/xsel
	x11-terms/rxvt-unicode[perl]"

src_install() {
	insinto /usr/$(get_libdir)/urxvt/perl
	doins keyboard-select
	doins url-select
	einstalldocs
}
