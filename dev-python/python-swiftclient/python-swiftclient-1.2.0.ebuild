# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="Python bindings to the OpenStack Object Storage API"
HOMEPAGE="http://docs.openstack.org/developer/python-swiftclient"
EGIT_REPO_URI="https://github.com/openstack/${PN}.git"
# 1.2.0
EGIT_COMMIT="68d1550"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		dev-python/simplejson
        !<sys-cluster/swift-1.7.4"

RDEPEND="${DEPEND}"

