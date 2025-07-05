import 'package:cat_sounds/di/model/di_module.dart';
import 'package:data/api/client/api_client.dart';
import 'package:data/api/dio/dio_factory.dart';
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
  final String _apiBaseUrl;
  final bool _isDevEnv;
  final bool _enableDebugView;

  const NetworkModule({
    required FirebaseRemoteConfig remoteConfig,
    required String apiBaseUrl,
    required bool isDevEnv,
    required bool enableDebugView,
  })  : _remoteConfig = remoteConfig,
        _apiBaseUrl = apiBaseUrl,
        _isDevEnv = isDevEnv,
        _enableDebugView = enableDebugView;

  @override
  Future<void> configureDependencies() async {
    final dioFactory = DioFactory();

    final baseDio = dioFactory.create(
      baseUrl: _apiBaseUrl,
      enableLogging: _isDevEnv,
      enableDebugView: _enableDebugView,
      interceptors: const [],
    );

    // TODO: Use ApiClient for network repositories.
    final apiClient = ApiClient(baseDio);

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
