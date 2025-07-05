#!/bin/sh

cd ../..
(
  cd data || exit
  dart run build_runner build --delete-conflicting-outputs
)
