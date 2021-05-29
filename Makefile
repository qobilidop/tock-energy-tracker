.PHONY: help
help:
	cat Makefile

.PHONY: setup
setup:
	brew tap ARMmbed/homebrew-formulae && brew update && brew install arm-none-eabi-gcc

.PHONY: fmt
fmt:
	$(MAKE) -C tock/ fmt

.PHONY: flash-board
flash-board:
	$(MAKE) -C tock/boards/nordic/nrf52840dk/ install

.PHONY: build-app
build-app:
	cd libtock-c/examples && ./build_all.sh

.PHONY: install-app
install-app:
	tockloader install --board nrf52dk --jlink libtock-c/examples/blink/build/blink.tab

.PHONY: uninstall-app
uninstall-app:
	tockloader uninstall --board nrf52dk --jlink
