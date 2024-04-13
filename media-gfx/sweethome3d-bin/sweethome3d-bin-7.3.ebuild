# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop

REAL_PN="SweetHome3D"
DESCRIPTION="Sweet Home 3D is a free interior design application/"
HOMEPAGE="https://sweethome3d.com"
SRC_URI="mirror://sourceforge/sweethome3d/${REAL_PN}-${PV}-linux-x64.tgz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-gtk-theme"

DEPEND="virtual/jre"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${REAL_PN}-${PV}"

src_install() {
	inst_path="/opt/${REAL_PN}"
	java_vars=( "-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true" )
	use gtk-theme && java_vars+=( "-Dsun.java2d.xrender=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel" )

	insinto "${inst_path}"
	doins -r *

	# ------------------
	# make wrapper
	# NOTE: make_wrapper will insert exec first, so no chance to put env
	# vairables before, hence manual way of creating it.
	local tmpwrapper="${T}/tmp.wrapper.${REAL_PN,,}"
	(
		echo "#!/bin/sh"
		echo "export _JAVA_OPTIONS='${java_vars[*]}'"
		echo "${inst_path}/${REAL_PN}" '"$@"'

	) > "${tmpwrapper}"
	chmod go+rx "${tmpwrapper}"
	newbin "${tmpwrapper}" "${REAL_PN,,}"
	# ------------------

	doicon "${REAL_PN}Icon.png"

	make_desktop_entry "${REAL_PN}" "${REAL_PN}" "${REAL_PN}"

	dodir $inst_path
	fperms 755 "${inst_path}/${REAL_PN}" \
		"${inst_path}/${REAL_PN}-Java3D-1_5_2" \
		"${inst_path}/runtime/bin/java"

}
