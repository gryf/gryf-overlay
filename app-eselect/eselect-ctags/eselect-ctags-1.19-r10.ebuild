EAPI=8

MY_P="eselect-emacs-${PV}"
DESCRIPTION="Manages ctags implementations"
HOMEPAGE="https://wiki.gentoo.org/wiki/Project:Emacs"
SRC_URI="https://dev.gentoo.org/~ulm/emacs/${MY_P}.tar.xz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="!<app-eselect/eselect-emacs-1.19
	>=app-admin/eselect-1.4.20"

S="${WORKDIR}/${MY_P}"
PATCHES=( "${FILESDIR}"/${P}_add-universal-ctags.patch )

src_install() {
	insinto /usr/share/eselect/modules
	doins {ctags,etags}.eselect
	doman {ctags,etags}.eselect.5
}
