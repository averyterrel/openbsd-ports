COMMENT=	PDF, PS and EPS viewer for GNUstep

REVISION =	14
DISTNAME=	GSPdf-0.5

HOMEPAGE=	http://gap.nongnu.org/gspdf/
SITES=		${SITE_SAVANNAH:=gap/}

MODULES=	x11/gnustep
WANTLIB += ${COMPILER_LIBCXX}
RUN_DEPENDS+=	print/ghostscript/gnu

pre-build:
	${SUBST_CMD} ${WRKDIST}/GSPdf.m

.include <bsd.port.mk>
