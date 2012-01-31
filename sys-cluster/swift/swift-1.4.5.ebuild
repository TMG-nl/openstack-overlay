# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Swift is a highly available, distributed, eventually consistent
object/blob store"
HOMEPAGE="https://launchpad.net/swift"
SRC_URI="http://launchpad.net/${PN}/essex/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="storage-server proxy-server"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		 dev-python/netifaces
		 dev-python/eventlet
		 dev-python/webob
		 dev-python/pastedeploy
		 dev-python/pyxattr"

REQUIRED_USE="|| ( storage-server proxy-server )"

src_install()
{
	distutils_src_install

	dodir "/var/run/swift"

	if use proxy-server; then
		newinitd "${FILESDIR}/swift-proxy-server.initd" swift-proxy-server
	fi

	if use storage-server; then
		newinitd "${FILESDIR}/swift-storage-server.initd" swift-storage-server
		newconfd "${FILESDIR}/swift-storage-server.confd" swift-storage-server
	fi
}
