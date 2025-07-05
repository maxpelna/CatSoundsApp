import 'package:firebase_remote_config/firebase_remote_config.dart';

final class RemoteConfigDefaults {
  static const appVersionIOS = 'app_version_ios';
  static const appVersionAndroid = 'app_version_android';
  static const shouldForceUpdateIOS = 'force_update_ios';
  static const shouldForceUpdateAndroid = 'force_update_android';

  static String prefix(bool isStaging) => isStaging ? 'staging_' : '';

  static const _debugMinimumFetchInterval = Duration(minutes: 5);
  static const _minimumFetchInterval = Duration(hours: 10);
  static const _fetchTimeout = Duration(seconds: 30);

  static Map<String, dynamic> defaults(bool isStaging) {
    final prefixValue = prefix(isStaging);

    return {
      prefixValue + appVersionIOS: '1.0',
      prefixValue + appVersionAndroid: '1.0',
      prefixValue + shouldForceUpdateIOS: false,
      prefixValue + shouldForceUpdateAndroid: false,
    };
  }

  static RemoteConfigSettings configSettings(bool isDebug) =>
      RemoteConfigSettings(
        fetchTimeout: _fetchTimeout,
        minimumFetchInterval:
            isDebug ? _debugMinimumFetchInterval : _minimumFetchInterval,
      );
}
