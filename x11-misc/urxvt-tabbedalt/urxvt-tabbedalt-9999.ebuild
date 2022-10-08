# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Extended tabbed plugin for rxvt-unicode"
HOMEPAGE="https://github.com/gryf/tabbedalt"
EGIT_REPO_URI="https://github.com/gryf/tabbedalt"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="x11-terms/rxvt-unicode[perl]"

src_install() {
	insinto /usr/$(get_libdir)/urxvt/perl
	doins tabbedalt
	einstalldocs
}
