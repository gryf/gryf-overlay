SRC_URI="http://toxygen.net/ydpdict/${P}.tar.gz"
src_compile() {
	econf || die 
	emake || die "emake failed"
}
src_install() {
	einstall || die
}
