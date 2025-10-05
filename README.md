# Meowpad

<video src="https://github.com/user-attachments/assets/e611f570-701c-4a2d-9053-207e2a7a9920" width="352" height="720"></video>

## Environment

To build this app use Flutter version 3.35.5

## Architecture

Project is following Clean architecture with 3 layers: data, domain, presentation (where presentation layer is feature-layered).
Each feature should have their own coordinator (flow), e.g. authorization, settings, main...
Root folder `lib` is an entry point where all dependencies are registered to DI container.
Presentation layer's state management tool is BLoC.

## Clean app & sync dependencies:

In order to keep app in sync with pubspec.yaml, `flutter clean && flutter pub get` should be called
from root, `domain`, `data` & `presentation`

(or run `run_clean.sh` in resources/scripts)

## Static code analysis:

Project uses DCM to ensure clean code.

In order to run static code analysis run `run_code_analysis.sh` in resources/scripts.

## Unit tests and Snapshot tests

Tests are written for BLoC (unit tests) and UI (snapshot tests)

To test app use `run_unit_tests.sh` in resources/scripts.
This will test both unit tests and golden tests

To update golden tests assets use `run_generate_golden_tests.sh` in resources/scripts.

To see you code coverage run `run_generate_unit_tests_coverage.sh` in resources/scripts.

## Generating assets:

Assets are generated via plugin - https://pub.dev/packages/flutter_gen_runner

To add new assets simply drag and drop them to correct folder in resources/assets/

`flutter packages pub run build_runner build --delete-conflicting-outputs`
(or run `run_generate_assets.sh` in resources/scripts)

## Generating translations:

App localization is done via flutter_localizations package.
To generate new translation keys add them to `lib/l10n/app_{locale}.arb` files (uses JSON syntax).
Translations will be generated after `flutter pub get` from root. 
To check for unused localization keys run `dcm check-unused-l10n --class-pattern AppLocalizations lib`

## Generating models:

Models are serialized / deserialized from JSON via
codegen - https://flutter.dev/docs/development/data-and-backend/json#creating-model-classes-the-json_serializable-way

All the entity models are in the `data` module. To re-generate the entity serialization code:
`cd data && flutter pub run build_runner build --delete-conflicting-outputs`

(or run `run_generate_json_models.sh` in resources/scripts)

## Generating splash screens:

Splash screens are generated via plugin - https://pub.dev/packages/flutter_native_splash
The configs are in the project level `pubspec.yaml`, the resources are in `resources/splash`

`flutter clean && flutter pub get && flutter pub run flutter_native_splash:create`
(or run `run_generate_splash.sh` in resources/scripts)

Important: if any of resources are .jpg, the plugin still renames them to .png, so need to manually
fix image extensions

## Generating app icons:

Launcher icons are generated via plugin - https://pub.dev/packages/flutter_launcher_icons
The configs are in the project level `pubspec.yaml`, the resources are in `resources/launcher`

`flutter clean && flutter pub get && flutter pub run flutter_launcher_icons:main`
(or run `run_generate_app_icon.sh` in resources/scripts)
