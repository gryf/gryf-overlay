# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Nyxt web brtowser - the internet on your terms."
HOMEPAGE="https://nyxt.atlas.engineer/"
EGIT_REPO_URI="https://github.com/atlas-engineer/nyxt"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

DEPEND="net-libs/webkit-gtk
	net-libs/glib-networking
	gnome-base/gsettings-desktop-schemas
	dev-lisp/libfixposix
	app-text/enchant"
RDEPEND="${DEPEND}"
BDEPEND="dev-lisp/sbcl
dev-lisp/asdf"
