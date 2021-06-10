.PHONY: help
help:
	cat Makefile

.PHONY: fmt
fmt:
	$(MAKE) -C extern/tock-tet/ fmt

.PHONY: build-orig
build-orig:
	$(MAKE) -C extern/tock-orig/boards/nordic/nrf52840dk/

.PHONY: build-base
build-base:
	$(MAKE) -C extern/tock-base/boards/nordic/nrf52840dk/

.PHONY: build-tet
build-tet:
	$(MAKE) -C extern/tock-tet/boards/nordic/nrf52840dk/

.PHONY: listen
listen:
	tockloader listen
