#!/bin/sh

cd ../..
(
  cd presentation || exit
  dart run build_runner build --delete-conflicting-outputs
)
