# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# version with fixed logging

EAPI=3
PYTHON_DEPEND=2
SUPPORT_PYTHON_ABIS=1
RESTRICT_PYTHON_ABIS="3.*"

inherit git-2 distutils

DESCRIPTION="A tool for auto-pinning kvm vcpus to physical threads on the local machine"
HOMEPAGE="https://github.com/hyves-org/pinhead"
EGIT_REPO_URI="https://github.com/hyves-org/pinhead.git"
# Pinning to 801bfb475e
# EGIT_COMMIT="801bfb475e"


LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-python/setuptools"
RDEPEND="${DEPEND}"
