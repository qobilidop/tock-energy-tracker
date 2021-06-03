#!/usr/bin/env bash

echo "Build Tock"
make -C ../extern/tock-et/boards/nordic/nrf52840dk

echo "Flash board"
make -C ../extern/tock-et/boards/nordic/nrf52840dk install

echo "Build app"
make -C ../app/blink0

echo "Uninstall previous apps"
tockloader uninstall --board nrf52dk --jlink

echo "Install app"
tockloader install --board nrf52dk --jlink ../app/blink0/build/blink0.tab
