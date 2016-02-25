# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils versionator

DESCRIPTION="IntelliJ IDEA Community Edition is an advanced Java IDE"
HOMEPAGE="http://jetbrains.com/idea/"
SRC_URI="http://download.jetbrains.com/idea/ideaIC-${PV}.tar.gz"
LICENSE="Apache-2.0"

SLOT="0"
RDEPEND=">=virtual/jdk-1.7"

IUSE=""
KEYWORDS="~amd64 ~x86"

# Actual version
REV=143.2287.1

S="${WORKDIR}/idea-IC-${REV}"

RESTRICT="strip"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

src_install() {
	local dest="/opt/${P}"

	# Remove unneeded binary for the ARM architecture
	rm bin/fsnotifier-arm

	insinto "${dest}"
	doins -r *

	# doins does not preserve executable bits
	fperms 755 "${dest}"/bin/{idea.sh,fsnotifier,fsnotifier64}

	newicon "bin/idea.png" "${PN}.png"
	make_wrapper ${PN} ${dest}/bin/idea.sh
	make_desktop_entry ${PN} "IntelliJ IDEA Community Edition" ${PN} "Development;Java;IDE"
}
