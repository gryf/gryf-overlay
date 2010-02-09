# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/xmms-wav/xmms-wav-1.2.10-r1.ebuild,v 1.7 2006/09/10 08:39:34 vapier Exp $

IUSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm ~hppa ia64 ~mips ~ppc ppc64 sparc x86"

DEPEND=">=media-sound/xmms-1.2.10"

PATCH_VER="2.2.2"

PLUGIN_PATH="Input/wav"

M4_VER="1.1"

inherit xmms-plugin
