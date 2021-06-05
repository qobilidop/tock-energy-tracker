.PHONY: help
help:
	cat Makefile

.PHONY: setup
setup:
	brew tap ARMmbed/homebrew-formulae && brew update && brew install arm-none-eabi-gcc

.PHONY: fmt
fmt:
	$(MAKE) -C extern/tock-et/ fmt

.PHONY: test-build
test-build:
	$(MAKE) -C extern/tock-et/boards/nordic/nrf52840dk/

.PHONY: test-install
test-install:
	$(MAKE) -C extern/tock-et/boards/nordic/nrf52840dk/ install

.PHONY: listen
listen:
	tockloader listen
