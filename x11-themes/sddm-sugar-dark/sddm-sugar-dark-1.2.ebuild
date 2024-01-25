# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The sweetest dark theme around for SDDM"
HOMEPAGE="https://github.com/MarianArlt/sddm-sugar-dark"
SRC_URI="https://github.com/MarianArlt/sddm-sugar-dark/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=x11-misc/sddm-0.18.0
	>=dev-qt/qtcore-5.11.0
	>=dev-qt/qtquickcontrols2-5.11.0
	>=dev-qt/qtsvg-5.11.0
"

src_install() {
	insinto /usr/share/sddm/themes/sugar-dark
	doins -r *
}

