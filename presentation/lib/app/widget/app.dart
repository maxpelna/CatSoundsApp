import 'package:chili_text_scale_factor/chili_text_scale_factor.dart';
import 'package:domain/analytics/repository/analytics_repository.dart';
import 'package:domain/locale/repository/locale_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/analytics/analytics_event_logger.dart';
import 'package:presentation/app/bloc/app_bloc.dart';
import 'package:presentation/coordinator/bloc/app_flow_state.dart';
import 'package:presentation/coordinator/flow/app_routes.dart';
import 'package:presentation/coordinator/widget/app_router_manager.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/di/di.dart';
import 'package:presentation/generated/assets/assets.gen.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';
import 'package:presentation/locale/app_locale_manager.dart';
import 'package:presentation/theme/app_theme_manager.dart';

final class App extends StatefulWidget {
  final bool enableDebugView;

  const App._({required this.enableDebugView});

  @override
  State<App> createState() => _AppState();

  static Widget withBloc({
    required bool enableDebugView,
  }) => BlocProvider(
    create: (_) => AppBloc(),
    child: App._(enableDebugView: enableDebugView),
  );
}

final class _AppState extends State<App> {
  late final AppBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read();
    _bloc.add(const StartAppEvent());

    WidgetsBinding.instance.addPostFrameCallback((_) => _preCacheImages());
  }

  @override
  Widget build(BuildContext context) => AppRouterManager(
    builder: (router) => BlocConsumer<AppBloc, AppBlocState>(
      builder: (context, state) => AnalyticsEventLogger(
        analyticsRepository: diContainer.get<AnalyticsRepository>(),
        child: AppLocaleManager(
          localeRepository: diContainer.get<LocaleRepository>(),
          builder: (locale) => AppThemeManager(
            isTestEnv: false,
            textScaleFactor: MediaQuery.textScalerOf(context).scale(1),
            builder: (theme, brightness) => MaterialApp.router(
              routerConfig: router,
              builder: (_, child) {
                if (child == null) return emptyWidget;

                return LimitTextScaleFactorWrapper(
                  child: child,
                );
              },
              title: 'YOUR APP NAME',
              theme: ThemeData(
                cupertinoOverrideTheme: CupertinoThemeData(
                  brightness: brightness,
                  primaryColor: theme?.colors.base.primary,
                ),
                brightness: brightness,
                pageTransitionsTheme: PageTransitionsTheme(
                  builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
                    TargetPlatform.values,
                    value: (_) =>  ZoomPageTransitionsBuilder(),
                  ),
                ),
              ),
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        ),
      ),
      listener: (_, state) {
        if (state.appFlowState is AuthenticatedState) {
          router.go(HomePageRoute().location);
        }
      },
    ),
  );

  void _preCacheImages() {
    final assets = Assets.resources.assets;
    for (final image in assets.images.values) {
      precacheImage(image.provider(), context);
    }
  }
}
