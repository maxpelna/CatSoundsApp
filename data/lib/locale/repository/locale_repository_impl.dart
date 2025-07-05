import 'package:collection/collection.dart';
import 'package:data/storage/shared_preferences_storage.dart';
import 'package:domain/locale/model/app_language.dart';
import 'package:domain/locale/repository/locale_repository.dart';

final class LocaleRepositoryImpl implements LocaleRepository {
  static const _localeStorageKey = 'key.app_language';

  final SharedPreferencesStorage _storage;

  const LocaleRepositoryImpl({
    required SharedPreferencesStorage storage,
  }) : _storage = storage;

  @override
  AppLanguage? get appLanguage {
    final code = _storage.getString(_localeStorageKey);

    return AppLanguage.values.firstWhereOrNull(
      (language) => language.code == code,
    );
  }

  @override
  Future<void> setAppLanguage(AppLanguage locale) async =>
      await _storage.setString(_localeStorageKey, locale.code);
}
