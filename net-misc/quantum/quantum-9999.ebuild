# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit git-2 distutils eutils

DESCRIPTION="Quantum is an incubated OpenStack project to provide 'network
connectivity as a service' between interface devices (e.g., vNICs) managed by
other Openstack services (e.g., nova). "
HOMEPAGE="http://wiki.openstack.org/Quantum"
EGIT_REPO_URI="https://github.com/openstack/quantum.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		dev-python/pep8
		dev-python/nosexcover
		dev-python/eventlet
		dev-python/routes
		dev-python/paste
		dev-python/pastedeploy
		dev-python/python-gflags
		dev-python/simplejson
		dev-python/sqlalchemy
		dev-python/webob
		dev-python/webtest
		dev-python/pip"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/server-setup-disable-initd-install.patch"
}

src_install() {
	for sub in client common server quantum; do
		cd ${S}/${sub}
		distutils_src_install
	done
	for plugin in cisco-plugin openvswitch-plugin sample-plugin; do
		cd ${S}/plugins/${plugin}
		distutils_src_install
	done

	newconfd "${FILESDIR}/quantum-server.confd" quantum-server
	newinitd "${FILESDIR}/quantum-server.initd" quantum-server

	diropts -m 0750
	dodir /var/run/quantum /var/log/quantum

	dodoc README
}
