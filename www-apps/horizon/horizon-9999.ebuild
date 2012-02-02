# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit git-2 distutils eutils

DESCRIPTION="The OpenStack Dashboard (Horizon) provides a baseline user
interface for managing OpenStack services. It is a reference implementation
built using the django-openstack project which contains all of the core
functionality needed to develop a site-specific implementation."
HOMEPAGE="http://wiki.openstack.org/OpenStackDashboard"
EGIT_REPO_URI="https://github.com/openstack/horizon"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="=dev-python/django-1.3.1
	    dev-python/python-dateutil
		dev-python/sphinx
		dev-python/cherrypy
		dev-python/coverage
		dev-python/nose
		dev-python/mox
		dev-python/pep8
		dev-python/pylint
		dev-python/pastedeploy
		dev-python/eventlet
		dev-python/kombu
		dev-python/pycrypto
		dev-python/routes
		dev-python/sqlalchemy
		dev-python/sqlalchemy-migrate
		dev-python/webob
		dev-python/pyxattr
		dev-python/python-gflags
		dev-python/python-novaclient
		dev-python/python-cloudfiles
		app-admin/glance
		dev-python/setuptools"
RDEPEND="${DEPEND}"

DISTUTILS_SETUP_FILES=("horizon/setup.py" "openstack-dashboard/setup.py")

src_install() {
	distutils_src_install

	#newconfd "${FILESDIR}/openstack-dashboard.confd" openstack-dashboard
	#newinitd "${FILESDIR}/openstack-dashboard.initd" openstack-dashboard

	#diropts -m 0750
	#dodir /var/run/quantum /var/log/quantum
}

