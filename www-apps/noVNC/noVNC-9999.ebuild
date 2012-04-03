# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit git-2

DESCRIPTION="noVNC is a VNC client implemented using HTML5 technologies,
specifically Canvas and WebSockets (supports 'wss://' encryption). noVNC is
licensed under the LGPLv3."
HOMEPAGE="http://kanaka.github.com/noVNC/"
EGIT_REPO_URI="https://github.com/cloudbuilders/noVNC"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
		dev-python/numpy
		www-misc/websockify"


src_compile() {
	cd ${S}/utils
	emake
}

src_install() {
	dodir /opt/noVNC
	dodir /opt/noVNC/utils
	dodir /opt/noVNC/include
	dodir /opt/noVNC/images

	exeinto /opt/noVNC/utils
	doexe utils/json2graph.py
	doexe utils/launch.sh
	doexe utils/nova-novncproxy
	doexe utils/rebind
	doexe utils/rebind.so
	doexe utils/u2x11
	doexe utils/web.py
	doexe utils/wsproxy.py
	doexe utils/websocket.py

	docinto /opt/noVNC/docs
	dodoc README.md
	dodoc LICENSE.txt

	dosym /opt/noVNC/images/favicon.ico /opt/noVNC/
	cp -pPR *.html ${D}/opt/noVNC/
	cp -pPR include/* ${D}/opt/noVNC/include
	cp -pPR images/* ${D}/opt/noVNC/images

	newconfd "${FILESDIR}/noVNC.confd" noVNC
	newinitd "${FILESDIR}/noVNC.initd" noVNC

	diropts -m 0750
	dodir /var/log/noVNC
}

