// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_page.dart';
import 'package:presentation/feature/settings/widget/settings_page.dart';
import 'package:presentation/splash/widget/splash_page.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
final class SplashRoute extends GoRouteData with _$SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SplashPage();
}

@TypedGoRoute<HomePageRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<SettingsPageRoute>(path: 'settings'),
  ],
)
final class HomePageRoute extends GoRouteData with _$HomePageRoute {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SoundPadPage();
}

final class SettingsPageRoute extends GoRouteData with _$SettingsPageRoute {
  const SettingsPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => CustomTransitionPage(
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final screenSize = context.totalSize;
      final topOffset = 44.0;
      final rightOffset = 34;
      final beginRadius = 0.0;
      final endRadius = screenSize.height * 1.2;

      final center = Offset(screenSize.width - rightOffset, context.topSafeArea + topOffset);

      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
      var tween = Tween(
        begin: beginRadius,
        end: endRadius,
      );
      var radiusTweenAnimation = tween.animate(curvedAnimation);

      return ClipPath(
        clipper: CsCircleRevealClipper(
          center: center,
          radius: radiusTweenAnimation.value,
        ),
        child: child,
      );
    },
    transitionDuration: duration300Milliseconds,
    opaque: false,
    barrierDismissible: false,
    child: SettingsPage(),
  );
}
