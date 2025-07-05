#!/bin/sh

cd ../..
flutter test --coverage && lcov --remove coverage/lcov.info '*_bloc_event.dart' '*/analytics/*' '*/env/*' '*/utils/*' '*/model/*' '*/widget/*' '*/flow/*' '*/design_system/*' -o coverage/lcov.info && genhtml coverage/lcov.info -o coverage/html
