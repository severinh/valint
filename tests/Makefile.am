include $(top_srcdir)/Makefile.decl

noinst_PROGRAMS = $(TEST_PROGS)

TEST_PROGS += tests

tests_SOURCES = \
	testcase.vala \
	testmain.vala \
	teststub.vala \
	$(NULL)

tests_DEPENDENCIES = \
	$(top_srcdir)/valint/valint-0.1.vapi \
	$(NULL)

tests_VALAFLAGS = \
	--basedir $(top_srcdir) \
	--vapidir $(top_srcdir)/valint \
	--vapidir $(top_srcdir)/vapi \
	--pkg valint-0.1 \
	$(VALAFLAGS) \
	$(NULL)

tests_CPPFLAGS = \
	-I$(top_srcdir)/valint \
	$(GLIB_CFLAGS) \
	$(NULL)

tests_LDADD = \
	$(GLIB_LIBS) \
	$(top_srcdir)/valint/libvalint-0.1.la \
	$(NULL)

coverage-reset:
	lcov --base-directory=@top_srcdir@ --directory @top_srcdir@/valint --zerocounters

coverage-report:
	lcov --directory @top_srcdir@/valint \
		--capture \
		--output-file @top_builddir@/lcov.info

	lcov --directory @top_srcdir@/valint \
		--output-file @top_builddir@/lcov.info \
		--remove @top_builddir@/lcov.info \
		"/usr/include/*" "*.c" "*.h" "*.vapi"

	$(mkdir_p) @top_builddir@/tests/coverage
	git_commit=`GIT_DIR=@top_srcdir@/.git git log -1 --pretty=format:%h 2>/dev/null`;\
	genhtml --title "@PACKAGE_STRING@ $$git_commit" \
		--output-directory @top_builddir@/tests/coverage @top_builddir@/lcov.info
	@echo
	@echo 'lcov report can be found in:'
	@echo 'file://@abs_top_builddir@/tests/coverage/index.html'
	@echo

clean-local:
	-rm -rf coverage

.PHONY: coverage-report