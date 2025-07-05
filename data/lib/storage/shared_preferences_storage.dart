import 'package:shared_preferences/shared_preferences.dart';

// This is not a DI repository, has to be used inside Data layer.
final class SharedPreferencesStorage {
  final SharedPreferences _sharedPreferences;

  const SharedPreferencesStorage(this._sharedPreferences);

  /// Get.
  String? getString(String key) => _sharedPreferences.getString(key);

  bool? getBool(String key) => _sharedPreferences.getBool(key);

  int? getInt(String key) => _sharedPreferences.getInt(key);

  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  Set<String> getKeys() => _sharedPreferences.getKeys();

  /// Set.
  Future<void> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);

  Future<void> setBool(String key, bool value) =>
      _sharedPreferences.setBool(key, value);

  Future<void> setInt(String key, int value) =>
      _sharedPreferences.setInt(key, value);

  Future<void> setDouble(String key, double value) =>
      _sharedPreferences.setDouble(key, value);

  /// Utility.
  Future<void> remove(String key) => _sharedPreferences.remove(key);

  Future<void> clearAll() => _sharedPreferences.clear();

  Map<String, String> readAll() {
    final allKeys = getKeys();
    var data = <String, String>{};

    for (final key in allKeys) {
      final value = _sharedPreferences.get(key);
      data[key] = value.toString();
    }

    return data;
  }
}
