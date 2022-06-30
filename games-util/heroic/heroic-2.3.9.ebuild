# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop linux-info unpacker xdg

DESCRIPTION="a Native alternative Linux Launcher for Epic Games"
HOMEPAGE="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher"
SRC_URI="https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v${PV}/${PN}-${PV}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="
	net-misc/curl
	sys-apps/gawk
	virtual/wine"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="
	opt/heroic/chrome-sandbox
	opt/heroic/libEGL.so
	opt/heroic/${PN}
	opt/heroic/libvulkan.so.1
	opt/heroic/libffmpeg.so
	opt/heroic/libGLESv2.so
	opt/heroic/swiftshader/libEGL.so
	opt/heroic/swiftshader/libGLESv2.so
	opt/heroic/libvk_swiftshader.so
	opt/heroic/resources/app.asar.unpacked/build/bin/linux/gogdl
	opt/heroic/resources/app.asar.unpacked/build/bin/linux/legendary
"

CONFIG_CHECK="~USER_NS"

src_install() {
	insinto /opt
	doins -r .
	mv ../image/opt/${P} ../image/opt/${PN}
	fperms +x /opt/${PN}/${PN}
	fperms +x /opt/${PN}/resources/app.asar.unpacked/build/bin/linux/legendary
	mkdir -p opt/bin
	dosym ../../opt/${PN}/${PN} opt/bin/${PN}
}
