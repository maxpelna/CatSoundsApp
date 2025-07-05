import 'package:cat_sounds/di/model/di_module.dart';
import 'package:data/locale/repository/locale_repository_impl.dart';
import 'package:data/stats/repository/stats_repository_impl.dart';
import 'package:data/storage/secure_storage.dart';
import 'package:data/storage/shared_preferences_storage.dart';
import 'package:data/theme/repository/theme_repository_impl.dart';
import 'package:domain/locale/repository/locale_repository.dart';
import 'package:domain/stats/repository/stats_repository.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:presentation/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kFirstTimeLaunch = 'key.first_time_launch';

final class StorageModule implements DIModule {
  const StorageModule();

  @override
  Future<void> configureDependencies() async {
    // Initialized only here.
    // ignore: banned-usage
    final sharedPrefs = await SharedPreferences.getInstance();
    final sharedPrefsStorage = SharedPreferencesStorage(sharedPrefs);

    // TODO: Use secure storage for user sensitive data.
    final secureKeyValueStorage = SecureStorage(
      const FlutterSecureStorage(),
      onError: (ex, st) => Fimber.e(
        'Operation with secure storage failed',
        ex: ex,
        stacktrace: st,
      ),
    );

    diContainer.registerLazySingleton<StatsRepository>(
      () => StatsRepositoryImpl(storage: sharedPrefsStorage),
    );
    diContainer.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(storage: sharedPrefsStorage),
    );
    diContainer.registerLazySingleton<LocaleRepository>(
      () => LocaleRepositoryImpl(storage: sharedPrefsStorage),
    );

    _potentiallyClearAllStorageAfterRepeatedInstall(
      preferences: sharedPrefs,
      prefsStorage: sharedPrefsStorage,
      secureStorage: secureKeyValueStorage,
    );
  }

  void _potentiallyClearAllStorageAfterRepeatedInstall({
    required SharedPreferences preferences,
    required SharedPreferencesStorage prefsStorage,
    required SecureStorage secureStorage,
  }) async {
    final isFirstLaunch = preferences.getBool(_kFirstTimeLaunch) ?? true;
    if (isFirstLaunch) {
      await prefsStorage.clearAll();
      await secureStorage.clearAll();
      await preferences.setBool(_kFirstTimeLaunch, false);
    }
  }
}
