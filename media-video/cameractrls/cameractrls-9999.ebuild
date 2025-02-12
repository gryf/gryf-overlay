# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..13} )
DISTUTILS_USE_PEP517=setuptools

inherit git-r3 distutils-r1

DESCRIPTION="Camera controls for Linux "
HOMEPAGE="https://github.com/soyersoyer/cameractrls"
EGIT_REPO_URI="https://github.com/gryf/cameractrls"
IUSE="-daemon doc gtk3 -gtk4 ptz view"

LICENSE="LGPLv3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	gui-libs/gtk
	=x11-libs/gtk+-3.22
	dev-python/pygobject[${PYTHON_USEDEP}]
	media-libs/libsdl2
	dev-libs/libspnav
"
RDEPEND="${DEPEND}"
BDEPEND=""

#python_compile(){
#}
#
#python_install() {
#	if use gtk4; then
#		python_newscript cameractrlsgtk4.py cameractrlsgtk4
#	elif use gtk3; then
#		python_newscript cameractrlsgtk.py cameractrlsgtk
#	fi
#
#	if use daemon; then
#		python_newscript cameractrlsd.py cameractrlsd
#	fi
#
#	if use ptz; then
#		python_newscript cameraptzgame.py cameraptzgame
#		python_newscript cameraptzmidi.py cameraptzmidi
#		python_newscript cameraptzspnav.py cameraptzspnav
#	fi
#
#	if use view; then
#		python_newscript cameraview.py cameraview
#	fi
#
#	python_domodule pysvn
#}
#
#python_install_all() {
#	use doc && local HTML_DOCS=( Docs/. )
#	if use examples; then
#		docinto examples
#		dodoc -r Examples/Client/.
#		docompress -x /usr/share/doc/${PF}/examples
#	fi
#}
