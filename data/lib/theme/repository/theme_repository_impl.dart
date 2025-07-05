import 'package:data/storage/shared_preferences_storage.dart';
import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';

final class ThemeRepositoryImpl implements ThemeRepository {
  static const _themeStorageKey = 'key.app_theme_mode';

  final SharedPreferencesStorage _storage;

  const ThemeRepositoryImpl({
    required SharedPreferencesStorage storage,
  }) : _storage = storage;

  @override
  AppThemeMode get themeMode {
    final index = _storage.getInt(_themeStorageKey) ?? 0;

    return AppThemeMode.fromRawValue(index);
  }

  @override
  Future<void> setThemeMode(AppThemeMode themeMode) async =>
      await _storage.setInt(_themeStorageKey, themeMode.index);
}
