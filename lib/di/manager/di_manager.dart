import 'package:cat_sounds/di/model/di_module.dart';
import 'package:cat_sounds/di/module/core_module.dart';
import 'package:cat_sounds/di/module/late_module.dart';
import 'package:cat_sounds/di/module/network_module.dart';
import 'package:cat_sounds/di/module/storage_module.dart';
import 'package:cat_sounds/env/env_config.dart';
import 'package:data/remote_config/model/remote_config_defaults.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:presentation/di/di.dart';

Future<void> configureDependencies() async {
  const enableDebugView = EnvConfig.enableDebugView;
  const isDevEnv = EnvConfig.isDevEnv;
  const apiBaseUrl = EnvConfig.apiBaseUrl;

  final analytics = await _initAnalytics();
  final remoteConfig = await _initRemoteConfig(isDevEnv);
  final packageInfo = await PackageInfo.fromPlatform();

  final coreModule = CoreModule(
    analytics: analytics,
    packageInfo: packageInfo,
  );
  const storageModule = StorageModule();
  final networkModule = NetworkModule(
    remoteConfig: remoteConfig,
    apiBaseUrl: apiBaseUrl,
    isDevEnv: isDevEnv,
    enableDebugView: enableDebugView,
  );
  const lateModule = LateModule();

  final diModules = <DIModule>[
    coreModule,
    storageModule,
    networkModule,
    lateModule,
  ];

  for (final module in diModules) {
    await module.configureDependencies();
  }

  await diContainer.allReady();
}

Future<FirebaseRemoteConfig> _initRemoteConfig(bool isDebug) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigDefaults.configSettings(isDebug),
  );
  await remoteConfig.setDefaults(
    RemoteConfigDefaults.defaults(isDebug),
  );

  return remoteConfig;
}

Future<FirebaseAnalytics> _initAnalytics() async {
  final analytics = FirebaseAnalytics.instance;
  await analytics.setAnalyticsCollectionEnabled(kReleaseMode);

  return analytics;
}
