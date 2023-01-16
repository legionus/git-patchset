TESTS = $(wildcard tests/*-ts)

.PHONY: $(TESTS)

verify:
	@shellcheck -e SC2004,SC2015,SC2295 git-patchset

check: $(TESTS)
	@echo tests/*.output | grep -qs ^

$(TESTS):
	@"$@" >"$@.output" 2>&1 && \
	    cmp -s "$@.expect" "$@.output" && \
	    rm -f -- "$@.output" && \
	    echo "$@ done" || \
	    echo "$@ FAILED"

