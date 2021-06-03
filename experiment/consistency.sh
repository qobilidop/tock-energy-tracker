#!/usr/bin/env bash

echo "Build Tock"
make -C ../extern/tock-et/boards/nordic/nrf52840dk

echo "Flash board"
make -C ../extern/tock-et/boards/nordic/nrf52840dk install

echo "Build app"
make -C ../app/led0
make -C ../app/led1
make -C ../app/led2
make -C ../app/led3

echo "Uninstall previous apps"
tockloader uninstall --board nrf52dk --jlink

echo "Install app"
tockloader install --board nrf52dk --jlink ../app/led0/build/led0.tab
tockloader install --board nrf52dk --jlink ../app/led1/build/led1.tab
tockloader install --board nrf52dk --jlink ../app/led2/build/led2.tab
tockloader install --board nrf52dk --jlink ../app/led3/build/led3.tab
