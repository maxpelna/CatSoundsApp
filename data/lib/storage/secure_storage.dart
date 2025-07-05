import 'package:flutter_secure_storage/flutter_secure_storage.dart';

typedef ErrorCallback = void Function(Object ex, StackTrace st);

// This is not a DI repository, has to be used inside Data layer.
final class SecureStorage {
  final bool iOSTransferToCloud;
  final ErrorCallback onError;
  final FlutterSecureStorage _storage;

  final _iOSDisableCloudStoringOptions = const IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );

  const SecureStorage(
    this._storage, {
    required this.onError,
    this.iOSTransferToCloud = true,
  });

  /// Get.
  IOSOptions? get _iosOptions =>
      iOSTransferToCloud ? null : _iOSDisableCloudStoringOptions;

  Future<bool?> getBool(String key) async {
    final val = await _read(key);
    if (val == null) return null;

    return val.toLowerCase() == 'true';
  }

  Future<int?> getInt(String key) async {
    final val = await _read(key);
    if (val == null) return null;

    return int.tryParse(val);
  }

  Future<String?> getString(String key) => _read(key);

  Future<double?> getDouble(String key) async {
    final val = await _read(key);
    if (val == null) return null;

    return double.tryParse(val);
  }

  Future<Set<String>> getKeys() async => (await _readAll()).keys.toSet();

  /// Set.
  Future<void> setBool(String key, bool value) async {
    await _write(key: key, value: value ? 'true' : 'false');
  }

  Future<void> setInt(String key, int value) async {
    await _write(key: key, value: value.toString());
  }

  Future<void> setString(String key, String value) async {
    await _write(key: key, value: value);
  }

  Future<void> setDouble(String key, double value) async {
    await _write(key: key, value: value.toString());
  }

  /// Utility.
  Future<void> remove(String key) async {
    try {
      await _storage.delete(
        key: key,
        iOptions: _iosOptions,
      );
    } catch (ex, st) {
      onError(ex, st);
    }
  }

  Future<void> clearAll() async {
    try {
      await _storage.deleteAll(
        iOptions: _iosOptions,
      );
    } catch (ex, st) {
      onError(ex, st);
    }
  }

  Future<Map<String, String>> readAll() async {
    final data = await _storage.readAll(
      iOptions: _iosOptions,
    );

    return Map.fromEntries(
      data.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)),
    );
  }

  Future<String?> _read(String key) async {
    try {
      return await _storage.read(
        key: key,
        iOptions: _iosOptions,
      );
    } catch (ex, st) {
      onError(ex, st);

      return null;
    }
  }

  Future<Map<String, String>> _readAll() async {
    try {
      return await _storage.readAll(
        iOptions: _iosOptions,
      );
    } catch (ex, st) {
      onError(ex, st);

      return {};
    }
  }

  Future<void> _write({required String key, required String value}) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        iOptions: _iosOptions,
      );
    } catch (ex, st) {
      onError(ex, st);
    }
  }
}
