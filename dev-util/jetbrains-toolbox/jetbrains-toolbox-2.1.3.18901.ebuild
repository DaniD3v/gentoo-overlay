EAPI=8

inherit desktop xdg

DESCRIPTION="Manage all your JetBrains Projects and Tools"
HOMEPAGE="https://www.jetbrains.com/toolbox/"
SRC_URI="https://download-cdn.jetbrains.com/toolbox/${P}.tar.gz"

LICENSE="JetBrains-individual"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="strip"

RDEPEND="sys-fs/fuse:0"

src_install() {
    dobin ${WORKDIR}/${P}/jetbrains-toolbox

    domenu ${FILESDIR}/jetbrains-toolbox.desktop
    doicon -s scalable ${FILESDIR}/jetbrains-toolbox.svg
}

pkg_postinst() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}

pkg_postrm() {
    xdg_desktop_database_update
    xdg_icon_cache_update
}
