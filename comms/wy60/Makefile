COMMENT=	curses-based emulator for the Wyse 60 terminal

DISTNAME=	wy60-2.0.9
REVISION=	1
CATEGORIES=	comms

MAINTAINER=	Christian Weisgerber <naddy@openbsd.org>

# GPLv2+
PERMIT_PACKAGE=	Yes

SITES=		https://distfiles.sigtrap.nl/

WANTLIB=	c curses

AUTOCONF_VERSION=2.61
CONFIGURE_STYLE=autoconf

post-install:
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/wy60
	${INSTALL_DATA} ${WRKSRC}/wy60.rc ${PREFIX}/share/examples/wy60/

.include <bsd.port.mk>
