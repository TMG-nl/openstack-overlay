# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="Keystone to Swift authentication and authorization system."
HOMEPAGE="https://launchpad.net/swift"
EGIT_REPO_URI="https://github.com/cloudbuilders/swift-keystone2.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-cluster/swift"
RDEPEND="${DEPEND}"

# Can only use this when python.eclass is using EAPI4
#REQUIRED_USE="|| ( storage-server proxy-server )"
