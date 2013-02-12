# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1

DESCRIPTIOn="Keystone is a cloud identity service written in Python, which
provides authentication, authorization, and an OpenStack service catalog. It
implements OpenStac's Identity API."
HOMEPAGE="https://launchpad.net/keystone"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ldap"

DEPEND="dev-python/setuptools
		dev-python/pep8
		dev-python/paste
		>=dev-python/pastedeploy-1.5.0
		=dev-python/routes-1.12.3
		>=dev-python/lxml-2.3
		<=dev-python/lxml-2.3.5
		dev-python/python-daemon
		>=dev-python/eventlet-0.9.17
		>=dev-python/greenlet-0.3.1
		>=dev-python/sqlalchemy-migrate-0.7.2
		>=dev-python/sqlalchemy-0.7.3
		>=dev-python/webob-1.0.8
		dev-python/pypam"
RDEPEND="${DEPEND}
		 dev-python/python-novaclient
		 dev-python/passlib
		 >=dev-python/iso8601-0.1.4
		 ldap? ( dev-python/python-ldap )"

src_install() {
	distutils-r1_src_install
	newconfd "${FILESDIR}/keystone.confd" keystone
	newinitd "${FILESDIR}/keystone.initd" keystone

	diropts -m 0750
	dodir /var/run/keystone /var/log/keystone
}
