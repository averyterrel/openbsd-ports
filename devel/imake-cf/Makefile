PKG_ARCH =	*
COMMENT =	config files for imake
CATEGORIES =	devel x11
V =		1.0.8
DISTNAME =	xorg-cf-files-${V}
PKGNAME =	imake-cf-${V}
SITES =		${SITE_XORG:=util/}

PERMIT_PACKAGE =	Yes

SUBST +=	-e 's|@prefix@|${X11BASE}|'
SUBST +=	-e 's|@FONTROOTDIR@|${X11BASE}/lib/X11/fonts|'
SUBST +=	-e 's|@ENCODINGSDIR|$${FONTROOTDIR}/encodings|'

XCONFDIR =	${PREFIX}/lib/X11/config

NO_TEST=	Yes

pre-configure:
	${SUBST_CMD} ${WRKSRC}/OpenBSD.cf

do-build:
	sed ${SUBST} <${WRKSRC}/site.def.in >${WRKSRC}/site.def

do-install:
	${INSTALL_DATA_DIR} ${XCONFDIR}
	for f in ${WRKSRC}/*.{cf,def,rules,tmpl}; do \
		${INSTALL_DATA} $$f ${XCONFDIR}; \
	done
	rm ${XCONFDIR}/Motif.rules
	rm ${XCONFDIR}/Motif.tmpl
	touch ${XCONFDIR}/host.def
	touch ${XCONFDIR}/date.def
	touch ${XCONFDIR}/version.def

.include <bsd.port.mk>
