# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTIOn="Keystone is a cloud identity service written in Python, which
provides authentication, authorization, and an OpenStack service catalog. It
implements OpenStac's Identity API."
HOMEPAGE="https://launchpad.net/keystone"
SRC_URI="https://github.com/openstack/keystone/tarball/${PV} ->
keystone-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/setuptools
		dev-python/pep8
		dev-python/lxml
		dev-python/python-daemon"
RDEPEND="${DEPEND}
		 dev-python/python-novaclient
		 dev-python/python-ldap"

src_unpack() {
	unpack ${A}
	mv *-${PN}-* "${S}"
}

