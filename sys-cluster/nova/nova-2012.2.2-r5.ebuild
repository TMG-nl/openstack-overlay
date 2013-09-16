# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils-r1 eutils

DESCRIPTION="Nova is a cloud computing fabric controller (the main part of an
IaaS system). It is written in Python."
HOMEPAGE="https://launchpad.net/nova"
SRC_URI="http://launchpad.net/${PN}/folsom/${PV}/+download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="controller"

DEPEND="dev-python/setuptools
		dev-python/netaddr 
        >=dev-python/eventlet-0.9.17
		>=dev-python/kombu-1.0.4
        >=dev-python/sqlalchemy-migrate-0.7.2
		>=dev-python/sqlalchemy-0.7.3
        =dev-python/cheetah-2.4.4
		=dev-python/amqplib-0.6.1
		>=dev-python/anyjson-0.2.4
        >=dev-python/lxml-2.3
		<=dev-python/lxml-2.3.5
		=dev-python/routes-1.12.3
		>=dev-python/webob-1.0.8
        >=dev-python/greenlet-0.3.1
		>=dev-python/pastedeploy-1.5.0
		dev-python/paste 
        =dev-python/suds-0.4
        dev-python/paramiko 
		=dev-python/Babel-0.9.6 
		dev-python/httplib2 
		>=dev-python/python-quantumclient-2.0
		>=dev-python/python-glanceclient-0.5.0
		<dev-python/python-glanceclient-2"
RDEPEND="${DEPEND}
         =dev-python/boto-2.1.1
		 >=dev-python/iso8601-0.1.4
         controller? ( net-misc/rabbitmq-server )"

src_prepare() {
	distutils-r1_src_prepare
	epatch "${FILESDIR}/${PN}-2012.2-092_add_instance_system_metadata.patch"
	epatch "${FILESDIR}/${PN}-2012.2.2-r1-vif.py_libvirt_use_e1000_for_bridges.patch"
	epatch "${FILESDIR}/${PN}-2012.2.2-r2-scheduler.patch"
	epatch "${FILESDIR}/${PN}-2012.2.2-r4-firewall.patch"
	epatch "${FILESDIR}/${PN}-2012.2.2-r5-libvirt-config.patch"
}

src_install() {
	distutils-r1_src_install
	newconfd "${FILESDIR}/nova.confd-2012.2" nova
	newinitd "${FILESDIR}/nova.initd-2012.2" nova

	for function in api cert compute consoleauth network objectstore scheduler volume xvpvncproxy; do
		dosym /etc/init.d/nova /etc/init.d/nova-${function}
	done

	diropts -m 0750
	dodir /var/run/nova /var/log/nova /var/lock/nova
}
