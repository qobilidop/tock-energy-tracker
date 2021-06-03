#!/usr/bin/env bash

echo "Build Tock"
make -C ../extern/tock-et/boards/nordic/nrf52840dk

echo "Flash board"
make -C ../extern/tock-et/boards/nordic/nrf52840dk install

echo "Build app"
make -C ../app/calibration

echo "Install app"
tockloader install --board nrf52dk --jlink ../app/calibration/build/calibration.tab
