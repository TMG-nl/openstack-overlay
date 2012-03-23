# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"

inherit distutils eutils

DESCRIPTION="The OpenStack Dashboard (Horizon) provides a baseline user
interface for managing OpenStack services. It is a reference implementation
built using the django-openstack project which contains all of the core
functionality needed to develop a site-specific implementation."
HOMEPAGE="http://wiki.openstack.org/OpenStackDashboard"
SRC_URI="http://launchpad.net/${PN}/essex/essex-rc1/+download/${P/_*/}~rc1.tar.gz"

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
		dev-python/python-keystoneclient
		dev-python/python-novaclient
		dev-python/python-cloudfiles
		app-admin/glance
		dev-python/setuptools"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${P/_*/}

src_install() {
	distutils_src_install
	dodoc ${FILESDIR}"/horizon_vhost.conf"
	dodir /etc/horizon
	insinto /etc/horizon
	doins ${S}/openstack_dashboard/local/local_settings.py
	# Little dirty this way, but get's the job done bro
	dosym /etc/horizon/local_settings.py /usr/lib64/python2.7/site-packages/openstack_dashboard/local/local_settings.py
}

pkg_postinst() {
	elog
	elog "A vhost configuration example for apache2 with mod_wsgi can be found"
	elog "in /usr/share/doc/${PF}/horizon_vhost.conf"
	elog "Adapt it to suite your needs, and install it in /etc/apache/vhosts.d/"
	elog "Replace localhost by the real servername"
	elog
	elog "The dashboard can be configured through /etc/horizon/settings.py"
	elog
}
