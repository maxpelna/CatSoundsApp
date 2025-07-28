// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/design/src/route/cs_circle_reveal_clipper.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_page.dart';
import 'package:presentation/feature/settings/widget/settings_page.dart';
import 'package:presentation/splash/widget/splash_page.dart';

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
      var screenSize = MediaQuery.sizeOf(context);
      final center = Offset(screenSize.width - 40, 40);
      final beginRadius = 0.0;
      final endRadius = screenSize.height * 1.2;

      var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      var tween = Tween(begin: beginRadius, end: endRadius);
      var radiusTweenAnimation = tween.animate(curvedAnimation);

      return ClipPath(
        clipper: CsCircleRevealClipper(center: center, radius: radiusTweenAnimation.value),
        child: child,
      );
    },
    transitionDuration: Duration(milliseconds: 300),
    reverseTransitionDuration: Duration(milliseconds: 300),
    opaque: false,
    barrierDismissible: false,
    child: SettingsPage(),
  );
}
