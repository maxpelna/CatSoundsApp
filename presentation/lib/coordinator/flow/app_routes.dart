// ignore_for_file: prefer-match-file-name

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/coordinator/widget/app_flow_listener_page.dart';
import 'package:presentation/feature/auth/login/widget/login_page.dart';
import 'package:presentation/feature/home/design_system/widget/design_system_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<AuthStateListenerRoute>(path: '/')
final class AuthStateListenerRoute extends GoRouteData with _$AuthStateListenerRoute {
  const AuthStateListenerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => AppFlowListenerPage.withBloc();
}

@TypedGoRoute<LoginPageRoute>(path: '/login')
final class LoginPageRoute extends GoRouteData with _$LoginPageRoute {
  const LoginPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

@TypedGoRoute<HomePageRoute>(path: '/home')
final class HomePageRoute extends GoRouteData with _$HomePageRoute {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DesignSystemPage();
}
