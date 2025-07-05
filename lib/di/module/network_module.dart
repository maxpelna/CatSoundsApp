import 'package:cat_sounds/di/model/di_module.dart';
import 'package:data/connectivity/repository/connectivity_repository_impl.dart';
import 'package:data/remote_config/repository/remote_config_repository_impl.dart';
import 'package:data/update/repository/update_repository_impl.dart';
import 'package:domain/connectivity/repository/connectivity_repository.dart';
import 'package:domain/platform/repository/platform_repository.dart';
import 'package:domain/remote_config/repository/remote_config_repository.dart';
import 'package:domain/update/repository/update_repository.dart';
import 'package:domain/version/repository/version_repository.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:presentation/di/di.dart';

final class NetworkModule implements DIModule {
  final FirebaseRemoteConfig _remoteConfig;
  final bool _isDevEnv;

  const NetworkModule({
    required FirebaseRemoteConfig remoteConfig,
    required bool isDevEnv,
  }) : _remoteConfig = remoteConfig,
       _isDevEnv = isDevEnv;

  @override
  Future<void> configureDependencies() async {
    diContainer.registerLazySingleton<ConnectivityRepository>(
      () => ConnectivityRepositoryImpl(),
    );
    diContainer.registerLazySingleton<RemoteConfigRepository>(
      () => RemoteConfigRepositoryImpl(
        remoteConfig: _remoteConfig,
        platformRepository: diContainer.get<PlatformRepository>(),
        isStaging: _isDevEnv,
      ),
    );
    diContainer.registerLazySingleton<UpdateRepository>(
      () => UpdateRepositoryImpl(
        versionRepository: diContainer.get<VersionRepository>(),
      ),
    );
  }
}
