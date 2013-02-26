# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/s3cmd/s3cmd-1.0.0.ebuild,v 1.4 2011/12/22 22:22:34 maekke Exp $

EAPI="3"
PYTHON_DEPEND="2"
PYTHON_USE_WITH="xml"

inherit git-2 distutils

KEYWORDS="amd64 x86"
DESCRIPTION="Command line client for Amazon S3"
HOMEPAGE="http://s3tools.org/s3cmd"
EGIT_REPO_URI="https://github.com/hyves-org/s3cmd.git"
EGIT_BRANCH="branch-1.0.x"
LICENSE="GPL-2"

IUSE=""
SLOT="0"

DEPEND=""
RDEPEND=""

PYTHON_MODNAME="S3"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_install() {
	S3CMD_INSTPATH_DOC=/usr/share/doc/${PF} distutils_src_install
	rm -rf "${D}"/usr/share/doc/${PF}/${PN}
}
