COMMENT =	fuzzy select anything

V =		4.0.0
DISTNAME =	pick-${V}

CATEGORIES =	sysutils

HOMEPAGE =	https://github.com/mptre/pick

MAINTAINER =	Anton Lindqvist <anton@openbsd.org>

# MIT
PERMIT_PACKAGE =	Yes

# uses pledge()
WANTLIB +=	c curses

SITES =		https://github.com/mptre/pick/releases/download/v${V}/

CONFIGURE_STYLE =	simple

.include <bsd.port.mk>
