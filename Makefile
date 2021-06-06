.PHONY: help
help:
	cat Makefile

.PHONY: fmt
fmt:
	$(MAKE) -C extern/tock-tet/ fmt

.PHONY: test-build
test-build:
	$(MAKE) -C extern/tock-tet/boards/nordic/nrf52840dk/

.PHONY: test-install
test-install:
	$(MAKE) -C extern/tock-tet/boards/nordic/nrf52840dk/ install

.PHONY: listen
listen:
	tockloader listen
