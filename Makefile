.PHONY: help
help:
	cat Makefile

.PHONY: setup
setup:
	brew tap ARMmbed/homebrew-formulae && brew update && brew install arm-none-eabi-gcc

.PHONY: fmt
fmt:
	$(MAKE) -C tock/ fmt

.PHONY: board-build
board-build:
	$(MAKE) -C tock/boards/nordic/nrf52840dk/

.PHONY: board-install
board-install:
	$(MAKE) -C tock/boards/nordic/nrf52840dk/ install

.PHONY: app-build
app-build:
	cd libtock-c/examples && ./build_all.sh

.PHONY: app-install
app-install:
	tockloader install --board nrf52dk --jlink libtock-c/examples/blink/build/blink.tab

.PHONY: app-uninstall
app-uninstall:
	tockloader uninstall --board nrf52dk --jlink

.PHONY: listen
listen:
	tockloader listen
