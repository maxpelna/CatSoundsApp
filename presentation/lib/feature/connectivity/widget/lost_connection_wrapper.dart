import 'package:flutter/material.dart';
import 'package:presentation/feature/connectivity/widget/lost_connection_page.dart';

final class LostConnectionWrapper extends StatelessWidget {
  final bool isLostConnection;
  final Widget child;

  const LostConnectionWrapper({
    super.key,
    required this.isLostConnection,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isLostConnection) LostConnectionPage(),
        ],
      );
}
