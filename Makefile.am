include $(top_srcdir)/Makefile.decl

ACLOCAL_AMFLAGS = -I m4
AM_DISTCHECK_CONFIGURE_FLAGS = --enable-introspection=no

SUBDIRS = \
	valint \
	valint-cli \
	tests \
	vapi \
	po \
	$(NULL)

if ENABLE_COVERAGE
coverage:
	$(MAKE) -C tests coverage-reset
	$(MAKE) -C tests test
	$(MAKE) -C tests coverage-report
else
coverage:
	@echo "The project has not been configured for coverage, check that you have gcov, lcov."
	@echo "Of course, do not use --disable-coverage"
	@exit 1
endif
.PHONY: coverage

EXTRA_DIST = \
	intltool-extract.in \
	intltool-merge.in \
	intltool-update.in

DISTCLEANFILES = \
	intltool-extract \
	intltool-merge \
	intltool-update
