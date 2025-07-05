import 'package:cat_sounds/di/model/di_module.dart';
import 'package:data/analytics/repository/analytics_repository_impl.dart';
import 'package:data/platform/repository/platform_repository_impl.dart';
import 'package:data/version/repository/version_repository_impl.dart';
import 'package:domain/analytics/repository/analytics_repository.dart';
import 'package:domain/platform/repository/platform_repository.dart';
import 'package:domain/version/repository/version_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:presentation/di/di.dart';

final class CoreModule implements DIModule {
  final FirebaseAnalytics _analytics;
  final PackageInfo _packageInfo;

  const CoreModule({
    required FirebaseAnalytics analytics,
    required PackageInfo packageInfo,
  })  : _analytics = analytics,
        _packageInfo = packageInfo;

  @override
  Future<void> configureDependencies() async {
    diContainer.registerLazySingleton<PlatformRepository>(
      () => const PlatformRepositoryImpl(),
    );
    diContainer.registerLazySingleton<AnalyticsRepository>(
      () => AnalyticsRepositoryImpl(analytics: _analytics),
    );
    diContainer.registerLazySingleton<VersionRepository>(
      () => VersionRepositoryImpl(packageInfo: _packageInfo),
    );
  }
}
