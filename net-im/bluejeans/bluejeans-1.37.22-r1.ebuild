# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm desktop

DESCRIPTION="Online meetings, video conferencing, and screen sharing for teams of any size"
HOMEPAGE="https://www.bluejeans.com"
SRC_URI="https://swdl.bluejeans.com/desktop/linux/1.37/1.37.22/bluejeans-1.37.22.x86_64.rpm"

LICENSE="BlueJeans"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/libudev-compat"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack() {
	rpm_src_unpack ${A}
}

src_install() {
	cp -R "${S}/"* "${D}/" || die "Install failed!"

	local res
	for res in 16 24 32 256; do
		newicon -s ${res} opt/${PN}/icons/hicolor/${res}x${res}/apps/${PN}.png ${PN}.png
	done

	fperms +x /opt/${PN}/${PN}
	fperms +x /opt/${PN}/${PN}-bin

	dosym /opt/${PN}/${PN} /opt/bin/${PN}
	dosym /opt/${PN}/${PN}-bin /opt/bin/${PN}-bin
	dosym /usr/lib/libudev.so /opt/${PN}/libudev.so.0

	domenu opt/${PN}/${PN}.desktop
}
