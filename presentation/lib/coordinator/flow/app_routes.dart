// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/feature/home/sound_pad/widget/sound_pad_page.dart';
import 'package:presentation/splash/widget/splash_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/')
final class SplashRoute extends GoRouteData with _$SplashRoute {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => SplashPage();
}

@TypedGoRoute<HomePageRoute>(path: '/home')
final class HomePageRoute extends GoRouteData with _$HomePageRoute {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SoundPadPage();
}
