import 'package:flutter/material.dart';
import 'package:presentation/coordinator/flow/app_flow_router.dart';
import 'package:presentation/utils/typedef/typedefs.dart' show RouterWidgetBuilder;

final class AppRouterManager extends StatefulWidget {
  final RouterWidgetBuilder builder;

  const AppRouterManager({super.key, required this.builder});

  @override
  State<AppRouterManager> createState() => _AppRouterManagerState();
}

final class _AppRouterManagerState extends State<AppRouterManager> {
  final _router = AppFlowRouter();

  @override
  Widget build(BuildContext context) => widget.builder(
    _router.routes,
  );
}
