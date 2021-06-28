# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

VALA_MIN_API_VERSION="0.26"
VALA_USE_DEPEND="vapigen"

inherit gnome2-utils meson vala xdg

DESCRIPTION="A simple ebook reader originally intended for Elementary OS"
HOMEPAGE="https://babluboy.github.io/bookworm"

if [[ ${PV} == 9999 ]];then
	inherit git-r3
	SRC_URI=""
	KEYWORDS=""
	EGIT_REPO_URI="https://github.com/babluboy/${PN}.git"
else
	SRC_URI="https://github.com/babluboy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	${PYTHON_DEPS}
	$(vala_depend)
	dev-libs/granite
	app-text/poppler[cairo]
	app-arch/unzip
	app-arch/unrar
	net-libs/webkit-gtk:4/37
	x11-libs/gtk+:3
	dev-db/sqlite:3
	dev-python/html2text
	dev-libs/appstream
"
RDEPEND="${DEPEND}"

DOCS="AUTHORS"

src_prepare(){
	export VALAC="$(type -p valac-$(vala_best_api_version))"
	default
}

src_install() {
	meson_src_install
	dosym com.github.babluboy.bookworm /usr/bin/${PN}
	default
}

pkg_preinst() {
	gnome2_schemas_savelist
	xdg_pkg_preinst
}

pkg_postinst() {
	gnome2_schemas_update
	xdg_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_pkg_postrm
}
