import 'dart:async';

import 'package:domain/locale/repository/locale_repository.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:presentation/di/di.dart';

import '../fakes/fake_locale_repository.dart';
import '../fakes/fake_theme_repository.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await GoldenToolkit.runWithConfiguration(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      WidgetsFlutterBinding.ensureInitialized();

      await loadAppFonts();

      diContainer.registerLazySingleton<ThemeRepository>(
        () => FakeThemeRepository(),
      );
      diContainer.registerLazySingleton<LocaleRepository>(
        () => FakeLocaleRepository(),
      );

      return testMain();
    },
    config: GoldenToolkitConfiguration(
      deviceFileNameFactory: _buildDeviceName,
    ),
  );
}

String _buildDeviceName(String name, Device device) =>
    'goldens/${name}__${device.name}.png';
