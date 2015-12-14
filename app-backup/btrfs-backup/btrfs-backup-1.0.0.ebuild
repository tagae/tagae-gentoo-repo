# © 1999–2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

inherit eutils systemd git-r3

DESCRIPTION="Backup BTRFS subvolumes"
BASE_SERVER_URI="https://github.com/tagae"
HOMEPAGE="${BASE_SERVER_URI}/${PN}"
#SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
EGIT_REPO_URI="https://github.com/tagae/btrfs-backup.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RESTRICT="mirror"

DEPEND=""

# These are the versions from which development started, but it is likely that
# older versions work as well.
RDEPEND="${DEPEND}
		>=sys-apps/coreutils-8.23
		>=app-shells/bash-4.2
		>=sys-fs/btrfs-progs-3.14"

src_install() {
	exeinto /usr/share/${PN}
	local cmd
	for suffix in snapshot copy cleanup; do
		doexe $suffix
		dosym ../share/${PN}/$suffix /usr/sbin/${PN}-$suffix
	done
	insinto /usr/share/${PN}
	doins common.sh cleanup.sh
	insinto /usr/share/"${PN}"/cleanup.d
	doins cleanup.d/*.sh
	dodoc README.md
	newdoc cleanup.d/README.md README-cleanup.md
}
