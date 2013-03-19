bin_PROGRAMS = valint

valint_SOURCES = \
	valint.vala

INCLUDES = \
	-include config.h \
	$(VALINT_CFLAGS) \
	-DLOCALEDIR=\""$(localedir)"\" \
	-DPKGDATADIR=\""$(pkgdatadir)"\" \
	-DPKGLIBDIR=\""$(pkglibdir)"\"

VALAFLAGS = \
	--vapidir=$(srcdir)/../vapi --pkg config \
	@VALINT_PACKAGES@

valint_LDADD = \
	$(VALINT_LIBS)
