# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
PYTHON_DEPENDS="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Provides services for discovering, registering, and retrieving
virtual machine images. Glance has a RESTful API that allows querying of VM
image metadata as well as retrieval of the actual image."
HOMEPAGE="https://launchpad.net/glance"
SRC_URI="http://launchpad.net/${PN}/diablo/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		 dev-python/webob
		 dev-python/httplib2
		 dev-python/routes
		 dev-python/paste
		 dev-python/pastedeploy
		 dev-python/pyxattr
		 dev-python/kombu"

