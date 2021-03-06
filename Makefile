PROJECT = $(shell basename $(shell pwd))

.PHONY: clean distclean
.PHONY: release

default: release

clean:
	./rebar3 clean
	rm -rf _build/*/rel
	rm -f _build/*/lib/*/ebin/*
	find . -name "erlcinfo" -exec rm {} \;

distclean: clean
	rm -rf _build
	rm -f rebar.lock
	rm -rf .release

release: clean
	./rebar3 release
