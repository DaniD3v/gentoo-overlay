EAPI=7

DESCRIPTION="Manage all your JetBrains Projects and Tools"
HOMEPAGE="https://www.jetbrains.com/toolbox/"
SRC_URI="https://download-cdn.jetbrains.com/toolbox/${P}.tar.gz"

LICENSE="jetbrains"
SLOT="0"
KEYWORDS="-*"
RESTRICT="strip"

RDEPEND="sys-fs/fuse"
DEPEND=""

src_install() {
    exeinto /opt/jetbrains-toolbox
    doexe ${WORKDIR}/${P}/jetbrains-toolbox

    insinto /opt/jetbrains-toolbox
    doins ${FILESDIR}/icon.svg

    insinto /usr/share/applications
    doins ${FILESDIR}/jetbrains-toolbox.desktop
}
