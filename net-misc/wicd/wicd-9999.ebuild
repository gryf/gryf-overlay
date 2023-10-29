# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# NOTE: WICD is still broken, although there was some work done with porting
# it to Python3 and make it work again. See https://git.launchpad.net/wicd for 
# latest commits.

EAPI=8

PYTHON_COMPAT=( python3_{11,12} )
PYTHON_REQ_USE="ncurses,xml"

inherit distutils-r1 linux-info readme.gentoo-r1 systemd git-r3

DISTUTILS_USE_PEP517=setuptools
DESCRIPTION="A lightweight wired and wireless network manager for Linux"
HOMEPAGE="https://launchpad.net/wicd"
EGIT_REPO_URI='https://git.launchpad.net/wicd'
#EGIT_COMMIT='63812468bec3ee94c2dd6c8268f9e7b341273be5'
#EGIT_REPO_URI='https://github.com/gryf/wicd'
#EGIT_REPO_URI='file:///home/gryf/Devel/Python/wicd'

LICENSE="GPL-2"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~mips ~ppc ~ppc64 ~x86"

KEYWORDS=""
IUSE="doc nls +pm-utils"

DEPEND="nls? ( dev-python/Babel[${PYTHON_USEDEP}] )"
RDEPEND="${PYTHON_DEPS}
	dev-python/dbus-python[${PYTHON_USEDEP}]
	|| (
		net-misc/dhcpcd
		net-misc/dhcp
		net-misc/pump
	)
	net-wireless/wireless-tools
	net-wireless/wpa_supplicant
	|| (
		sys-apps/net-tools
		sys-apps/ethtool
	)
	dev-python/urwid[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
	pm-utils? ( sys-power/pm-utils )
	"
PATCHES=(
	# This one is probably not needed: "${FILESDIR}"/${PN}-init-sve-start.patch
	# The Categories entry in the .desktop files is outdated. Valid.
	"${FILESDIR}"/${PN}-1.7.2.4-fix-desktop-categories.patch
	# Upstream bug https://bugs.launchpad.net/wicd/+bug/1412413
	# Creates files -> give -p
	# This one is probably outdated now: "${FILESDIR}"/${PN}-1.7.3-add-missing-gnome-shell-extension.patch
	# If LANG is undefined, build can fail (bug 537202)
	# Outdated, setup.py is totally rewroten: "${FILESDIR}"/${PN}-1.7.3-undefined-LANG.patch
	# Fix urwid compat again
	# This one might be not needed, as currently urwid is in version 2.1.x: "${FILESDIR}"/${PN}-1.7.3-urwid-1.3.0.patch
	# Another compatibility patch from launchpad bug 1075399. This one is 
	# valid.
	"${FILESDIR}"/${PN}-1.7.3-bitrate-property.patch
)

src_prepare() {
	CONFIG_CHECK="~CFG80211_WEXT"
	local WARNING_CFG80211_WEXT="Wireless extensions have not been \
	configured in your kernel.  Wicd will not work unless CFG80211_WEXT is set."
	check_extra_config

	default

	if use nls; then
	  # Asturian is faulty with PyBabel
	  # (https://bugs.launchpad.net/wicd/+bug/928589)
	  rm po/ast.po
	  # zh_CN fails with newer PyBabel (Aug 2013)
	  rm po/zh_CN.po
	else
	  # nuke translations
	  rm po/*.po
	fi

	DOC_CONTENTS="To start wicd at boot with openRC, add
		/etc/init.d/wicd to a runlevel and: (1) Remove all net.*
		initscripts (except for net.lo) from all runlevels (2) Add these
		scripts to the RC_PLUG_SERVICES line in /etc/rc.conf (For
		example, rc_hotplug=\"!net.eth* !net.wlan*\")"
}

src_configure() {
	local myconf
	use pm-utils || myconf="${myconf} --no-install-pmutils"
	python_setup
	"${EPYTHON}" ./setup.py configure --no-install-docs \
		--resume=/usr/share/wicd/scripts/ \
		--suspend=/usr/share/wicd/scripts/ \
		--verbose ${myconf}
}

src_install() {
	distutils-r1_src_install
	keepdir /var/lib/wicd/configurations
	keepdir /etc/wicd/scripts/{postconnect,disconnect,preconnect}
	keepdir /var/log/wicd
	use nls || rm -rv "${D}"/usr/share/locale
	systemd_dounit "${S}/data/systemd/wicd.service"

	readme.gentoo_create_doc
}

pkg_postinst() {
	# Maintainer's note: the consolekit use flag short circuits a dbus rule and
	# allows the connection. Else, you need to be in the group.
	if ! has_version sys-auth/consolekit; then
		ewarn "Wicd-1.6 and newer requires your user to be in the 'users' group. If"
		ewarn "you are not in that group, then modify /etc/dbus-1/system.d/wicd.conf"
	fi

	readme.gentoo_print_elog
}
