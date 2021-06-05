#!/usr/bin/env bash
echo "Tock version: $TOCK"
echo "Apps to install: $APPS"

echo "Build Tock"
make -C ../extern/"$TOCK"/boards/nordic/nrf52840dk

echo "Flash board"
make -C ../extern/"$TOCK"/boards/nordic/nrf52840dk install

echo "Build app"
for app in $APPS
do
    make -C ../app/"$app"
done

echo "Uninstall previous apps"
tockloader uninstall --board nrf52dk --jlink

echo "Install app"
for app in $APPS
do
    tockloader install --board nrf52dk --jlink ../app/"$app/build/$app.tab"
done
