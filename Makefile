EXPECT = expect
RUNTEST = runtest
srcdir = 
HOST_SUBDIR = .

BASE_EXPORTS =

HOST_EXPORTS = \
  $(BASE_EXPORTS) \
  CC="$(CC)"; export CC; \
  AS="$(AS)"; export AS; \
  OBJDUMP="$(OBJDUMP)"; export OBJDUMP; \
  LD="$(LD)"; export LD; 

.PHONY: check do-check
check: do-check

do-check: do-binutils-check do-profiler-check

do-binutils-check:
	@: $(MAKE); $(unstage)
	@r=`${PWD_COMMAND}`; export r; \
	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
	$(HOST_EXPORTS) \
	(cd $(HOST_SUBDIR)/testsuites/binutils && \
	$(MAKE) $(FLAGS_TO_PASS)  check)

do-profiler-check:
	@: $(MAKE); $(unstage)
	@r=`${PWD_COMMAND}`; export r; \
	s=`cd $(srcdir); ${PWD_COMMAND}`; export s; \
	$(HOST_EXPORTS) \
	(cd $(HOST_SUBDIR)/testsuites/profiler && \
	$(MAKE) $(FLAGS_TO_PASS)  check)

