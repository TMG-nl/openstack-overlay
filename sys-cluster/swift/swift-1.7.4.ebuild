# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1 eutils

DESCRIPTION="Swift is a highly available, distributed, eventually consistent
object/blob store"
HOMEPAGE="https://launchpad.net/swift"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="storage-server proxy-server"

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}
		>=dev-python/netifaces-0.6
		>=dev-python/configobj-4.7.1
		>=dev-python/eventlet-0.9.15
		>=dev-python/greenlet-0.3.1
		>=dev-python/webob-1.0.8
		<dev-python/webob-1.3
		>=dev-python/pastedeploy-1.3.3
		>=dev-python/simplejson-2.0.9
		>=dev-python/pyxattr-0.4
		>=dev-python/python-swiftclient-1.2.0"

# Can only use this when python.eclass is using EAPI4
#REQUIRED_USE="|| ( storage-server proxy-server )"

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
