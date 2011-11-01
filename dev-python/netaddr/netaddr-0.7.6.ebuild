# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS=1
PYTHON_DEPEND="2:2.7"

DISTUTILS_USE_SEPARATE_SOURCE_DIRECTORIES=1

inherit python distutils

DESCRIPTION="Netaddr is a pure Python network address representation and
manipulation library."
HOMEPAGE="http://github.com/drkjam/netaddr"
SRC_URI="https://github.com/downloads/drkjam/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

