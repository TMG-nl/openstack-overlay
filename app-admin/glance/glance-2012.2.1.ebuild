# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_DEPENDS="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1

DESCRIPTION="Provides services for discovering, registering, and retrieving
virtual machine images. Glance has a RESTful API that allows querying of VM
image metadata as well as retrieval of the actual image."
HOMEPAGE="https://launchpad.net/glance"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		>=dev-python/greenlet-0.3.1
		>=dev-python/sqlalchemy-0.7
		dev-python/anyjson
		>=dev-python/eventlet-0.9.12
		dev-python/pastedeploy
		dev-python/routes
		>=dev-python/webob-1.0.8
		dev-python/wsgiref
		virtual/python-argparse
		=dev-python/boto-2.1.1
		>=dev-python/sqlalchemy-migrate-0.7
		dev-python/httplib2
		dev-python/kombu
		>=dev-python/pycrypto-2.1.0
		>=dev-python/iso8601-0.1.4
		>=dev-python/python-swiftclient-1.2
		<dev-python/python-swiftclient-2
		dev-python/lxml
		dev-python/paste
		dev-python/passlib
		dev-python/jsonschema"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
	newconfd "${FILESDIR}/glance.confd" glance
	newinitd "${FILESDIR}/glance.initd" glance

	for function in api registry scrubber; do
		dosym /etc/init.d/glance /etc/init.d/glance-${function}
	done

	diropts -m 0750
	dodir /var/run/glance /var/log/nova /var/lock/nova
}
