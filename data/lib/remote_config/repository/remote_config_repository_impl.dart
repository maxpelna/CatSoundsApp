import 'package:data/remote_config/model/remote_config_defaults.dart';
import 'package:domain/platform/repository/platform_repository.dart';
import 'package:domain/remote_config/model/rc_update_config.dart';
import 'package:domain/remote_config/repository/remote_config_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rxdart/rxdart.dart';

final class RemoteConfigRepositoryImpl implements RemoteConfigRepository {
  final FirebaseRemoteConfig _remoteConfig;
  final PlatformRepository _platformRepository;
  final bool _isStaging;

  final _rcUpdateConfigStream = BehaviorSubject<RcUpdateConfig>();

  RemoteConfigRepositoryImpl({
    required FirebaseRemoteConfig remoteConfig,
    required PlatformRepository platformRepository,
    required bool isStaging,
  })  : _remoteConfig = remoteConfig,
        _platformRepository = platformRepository,
        _isStaging = isStaging {
    _initialLoad();
  }

  Future<void> _initialLoad() async {
    try {
      await _remoteConfig.fetchAndActivate();
      _rcUpdateConfigStream.add(_rcUpdateConfig);

      // Done as per documentation.
      // ignore: avoid-passing-async-when-sync-expected
      _remoteConfig.onConfigUpdated.listen((event) async {
        await _remoteConfig.activate();

        _rcUpdateConfigStream.add(_rcUpdateConfig);
      });
    } catch (ex) {
      Fimber.e('Failed to fetch remote config', ex: ex);
    }
  }

  @override
  Stream<RcUpdateConfig> get rcUpdateConfigStream =>
      _rcUpdateConfigStream.stream;

  RcUpdateConfig get _rcUpdateConfig => RcUpdateConfig(
        latestAppVersion: _latestAppVersion,
        isForceUpdate: _isForceUpdate,
      );

  bool get _isForceUpdate => _platformRepository.isIos
      ? _remoteConfig.getBool(
          _prefix + RemoteConfigDefaults.shouldForceUpdateIOS,
        )
      : _remoteConfig.getBool(
          _prefix + RemoteConfigDefaults.shouldForceUpdateAndroid,
        );

  String get _latestAppVersion => _platformRepository.isIos
      ? _remoteConfig.getString(
          _prefix + RemoteConfigDefaults.appVersionIOS,
        )
      : _remoteConfig.getString(
          _prefix + RemoteConfigDefaults.appVersionAndroid,
        );

  String get _prefix => RemoteConfigDefaults.prefix(_isStaging);
}
