TESTS = $(wildcard tests/*-ts)

.PHONY: $(TESTS)

check: $(TESTS)
	@echo tests/*.output | grep -qs ^

$(TESTS):
	@"$@" >"$@.output" 2>&1 && \
	    cmp -s "$@.expect" "$@.output" && \
	    rm -f -- "$@.output" && \
	    echo "$@ done" || \
	    echo "$@ FAILED"

