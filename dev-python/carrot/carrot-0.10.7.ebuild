# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="AMQP Messaging Framework for Python"
HOMEPAGE="http://github.com/ask/carrot/"
SRC_URI="http://pypi.python.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/anyjson
		>=dev-python/amqplib-0.6
		dev-python/setuptools"
RDEPEND="${DEPEND}"

