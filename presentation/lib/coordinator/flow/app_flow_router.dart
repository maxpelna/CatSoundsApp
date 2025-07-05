import 'package:fimber/fimber.dart' show Fimber;
import 'package:firebase_analytics/firebase_analytics.dart' show FirebaseAnalyticsObserver, FirebaseAnalytics;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/coordinator/flow/app_routes.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();

final class AppFlowRouter {
  late final GoRouter _goRouter;

  GoRouter get routes => _goRouter;

  AppFlowRouter({bool debugLogDiagnostics = false}) {
    _goRouter = _routes(debugLogDiagnostics);
  }

  GoRouter _routes(bool debugLogDiagnostics) => GoRouter(
    routes: $appRoutes,
    onException: (_, state, _) {
      final pathName = state.name;

      if (pathName == null) return;

      Fimber.e('Failed to navigate to screen: $pathName', ex: state.error);
    },
    initialLocation: const SplashRoute().location,
    observers: [
      FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
    ],
    debugLogDiagnostics: debugLogDiagnostics,
    navigatorKey: rootNavigationKey,
  );
}
