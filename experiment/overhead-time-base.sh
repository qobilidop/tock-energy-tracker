#!/usr/bin/env bash

echo "Build Tock"
make -C ../extern/tock/boards/nordic/nrf52840dk

echo "Flash board"
make -C ../extern/tock/boards/nordic/nrf52840dk install

echo "Build app"
make -C ../app/timing

echo "Uninstall previous apps"
tockloader uninstall --board nrf52dk --jlink

echo "Install app"
tockloader install --board nrf52dk --jlink ../app/timing/build/timing.tab
