# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Swift is a highly available, distributed, eventually consistent
object/blob store"
HOMEPAGE="https://launchpad.net/swift"
SRC_URI="http://launchpad.net/${PN}/diablo/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		 dev-python/netifaces
		 dev-python/eventlet
		 dev-python/webob
		 dev-python/pastedeploy
		 dev-python/pyxattr"

