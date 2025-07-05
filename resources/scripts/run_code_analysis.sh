#!/bin/zsh

# navigate to repo root from /resources/scripts
cd ../..
flutter analyze ./ ./presentation ./data/ ./domain/ ./test/
(
  cd domain || exit
  dcm analyze lib
)
(
  cd data || exit
  dcm analyze lib
)
(
  cd presentation || exit
  dcm analyze lib
)

dcm analyze lib

dcm analyze test