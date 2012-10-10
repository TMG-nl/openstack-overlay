# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Cinder is the soon to be incubated project for block storage within
OpenStack. This is a spin out of nova-volumes."
HOMEPAGE="https://launchpad.net/cinder"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools
		>=dev-python/amqplib-0.6.1
		>=dev-python/anyjson-0.2.4
        >=dev-python/lockfile-0.8
        >=dev-python/kombu-1.0.4
        dev-python/eventlet
        >=dev-python/sqlalchemy-migrate-0.7.2
		>=dev-python/sqlalchemy-0.7.3
		>=dev-python/routes-1.12.3
        >=dev-python/lxml-2.3
		>=dev-python/python-daemon-1.5.5
        >=dev-python/wsgiref-0.1.2
        >=dev-python/suds-0.4
        dev-python/paramiko
		dev-python/paste
		>=dev-python/pastedeploy-1.5.0
		>=dev-python/greenlet-0.3.1
		>=dev-python/webob-1.0.8
		>=dev-python/Babel-0.9.6"
RDEPEND="${DEPEND}
         <dev-python/python-glanceclient-2
		 >=dev-python/iso8601-0.1.4"

S=${WORKDIR}/${P/_*/}

src_install() {
	distutils_src_install
	newconfd "${FILESDIR}/cinder.confd" cinder
	newinitd "${FILESDIR}/cinder.initd" cinder

	diropts -m 0750
	dodir /var/run/cinder /var/log/cinder /var/lock/cinder
}
