.PHONY: setup
setup:
	brew tap ARMmbed/homebrew-formulae && brew update && brew install arm-none-eabi-gcc

.PHONY: build
build:
	cd libtock-c/examples && ./build_all.sh

.PHONY: install
install:
	tockloader install --board nrf52dk --jlink libtock-c/examples/blink/build/blink.tab

.PHONY: uninstall
uninstall:
	tockloader uninstall --board nrf52dk --jlink
