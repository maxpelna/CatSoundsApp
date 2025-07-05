#!/bin/zsh

# navigate to repo root from /resources/scripts
cd ../..
dart run build_runner build --delete-conflicting-outputs
