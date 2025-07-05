#!/bin/sh

# navigate to repo root from /resources/scripts
cd ../..
(
  cd domain || exit
  flutter clean
  flutter pub get
)
(
  cd data || exit
  flutter clean
  flutter pub get
)
(
  cd presentation || exit
  flutter clean
  flutter pub get
)

# clean lib
flutter clean
flutter pub get
