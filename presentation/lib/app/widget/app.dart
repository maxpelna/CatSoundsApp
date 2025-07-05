import 'package:chili_debug_view/chili_debug_view.dart';
import 'package:chili_text_scale_factor/chili_text_scale_factor.dart';
import 'package:domain/analytics/repository/analytics_repository.dart';
import 'package:domain/connectivity/repository/connectivity_repository.dart';
import 'package:domain/locale/repository/locale_repository.dart';
import 'package:domain/remote_config/repository/remote_config_repository.dart';
import 'package:domain/update/repository/update_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/analytics/analytics_event_logger.dart';
import 'package:presentation/app/bloc/app_bloc.dart';
import 'package:presentation/coordinator/flow/app_flow_router.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/di/di.dart';
import 'package:presentation/feature/connectivity/widget/lost_connection_wrapper.dart';
import 'package:presentation/feature/update/widget/force_update_wrapper.dart';
import 'package:presentation/generated/assets/assets.gen.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';
import 'package:presentation/locale/app_locale_manager.dart';
import 'package:presentation/theme/app_theme_manager.dart';

final class App extends StatefulWidget {
  final bool enableDebugView;

  const App._({required this.enableDebugView});

  @override
  State<App> createState() => _AppState();

  static Widget withBloc({required bool enableDebugView}) => BlocProvider(
    create: (_) => AppBloc(
      connectivityRepository: diContainer.get<ConnectivityRepository>(),
      remoteConfigRepository: diContainer.get<RemoteConfigRepository>(),
      updateRepository: diContainer.get<UpdateRepository>(),
    ),
    child: App._(enableDebugView: enableDebugView),
  );
}

final class _AppState extends State<App> {
  late final AppBloc _bloc;
  final _appFlowRouter = AppFlowRouter();

  @override
  void initState() {
    super.initState();

    _bloc = context.read();
    _bloc.add(const ListenToConnectionStatusEvent());
    _bloc.add(const ListenUpdateConfigStatusEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) => _preCacheImages());
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppBlocState>(
    builder: (context, state) => AnalyticsEventLogger(
      analyticsRepository: diContainer.get<AnalyticsRepository>(),
      child: AppLocaleManager(
        localeRepository: diContainer.get<LocaleRepository>(),
        builder: (locale) => AppThemeManager(
          isTestEnv: false,
          textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
          builder: (theme, brightness) => MaterialApp.router(
            routerConfig: _appFlowRouter.routes,
            builder: (_, child) {
              if (child == null) return emptyWidget;

              final isConnected = state.isConnected.value;
              final updateConfig = state.updateConfig.value;

              return LostConnectionWrapper(
                isLostConnection: isConnected == false,
                child: ForceUpdateWrapper(
                  isForceUpdate: updateConfig?.status.isForceUpdate ?? false,
                  child: LimitTextScaleFactorWrapper(
                    child: DebugView(
                      navigatorKey: rootNavigationKey,
                      showDebugViewButton: widget.enableDebugView,
                      app: child,
                    ),
                  ),
                ),
              );
            },
            title: 'YOUR APP NAME',
            theme: ThemeData(
              cupertinoOverrideTheme: CupertinoThemeData(
                brightness: brightness,
                primaryColor: theme?.colors.base.primary,
              ),
              brightness: brightness,
            ),
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    ),
  );

  void _preCacheImages() {
    final assets = Assets.resources.assets;
    for (final image in assets.images.values) {
      precacheImage(image.provider(), context);
    }
  }
}
