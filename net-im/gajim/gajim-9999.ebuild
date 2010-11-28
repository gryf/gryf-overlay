# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/gajim/gajim-0.13.1.ebuild,v 1.2 2010/01/05 07:22:35 pva Exp $

EAPI="2"

PYTHON_DEPEND="2:2.5"
inherit python eutils autotools versionator mercurial

EHG_REPO_URI="http://hg.gajim.org/gajim/"
EHG_REVISION="otr"
S="${WORKDIR}/${PN}"

DESCRIPTION="Jabber client written in PyGTK"
HOMEPAGE="http://www.gajim.org/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd"
IUSE="avahi crypt dbus gnome idle libnotify nls spell srv trayicon X xhtml"

COMMON_DEPEND=">=dev-python/pygtk-2.12.0"

DEPEND="${COMMON_DEPEND}
	>=sys-devel/gettext-0.17-r1
	>=dev-util/intltool-0.40.1
	dev-util/pkgconfig"

RDEPEND="${COMMON_DEPEND}
	>=dev-lang/python-2.5[sqlite,xml]
	dev-python/pyopenssl
	dev-python/sexy-python
	net-im/python-otr
	dev-python/libasyncns-python
	gnome? (
		dev-python/libgnome-python
		dev-python/gnome-keyring-python
		trayicon? ( dev-python/egg-python ) )
	dbus? (
		dev-python/dbus-python
		dev-libs/dbus-glib
		libnotify? ( dev-python/notify-python )
		avahi? ( net-dns/avahi[dbus,gtk,python] ) )
	xhtml? ( dev-python/docutils )
	srv? ( || (
			net-dns/bind-tools ) )
	idle? ( x11-libs/libXScrnSaver )
	spell? ( app-text/gtkspell )
	crypt? (
		app-crypt/gnupg
		dev-python/pycrypto )"

pkg_setup() {
	if ! use dbus; then
		if use libnotify; then
			eerror "The dbus USE flag is required for libnotify support"
			die "USE=\"dbus\" needed for libnotify support"
		fi
		if use avahi; then
			eerror "The dbus USE flag is required for avahi support"
			die "USE=\"dbus\" needed for avahi support"
		fi
	fi
}

src_prepare() {
	# install pyfiles in /usr/lib/python2.x/site-packages/gajim
	# upstream: http://trac.gajim.org/ticket/5460
	#epatch "${FILESDIR}/${PN}-0.13-autotools--enable-site-packages_option.patch"
	# http://trac.gajim.org/ticket/5457
	#epatch "${FILESDIR}/${PN}-0.13.1-define-exception.patch"
	cp "${FILESDIR}/POTFILES.in" "${S}/po/"
	intltoolize --force --copy --automake
	eautoreconf
}

src_configure() {
	local myconf

	econf \
		$(use_enable nls) \
		$(use_with X x) \
		--docdir="/usr/share/doc/${PF}" \
		--libdir="$(python_get_sitedir)" \
		--enable-site-packages \
		${myconf}
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dohtml README.html
}

pkg_postinst() {
        python_mod_optimize /usr/share/gajim/
}

pkg_postrm() {
        python_mod_cleanup /usr/share/gajim/
}
