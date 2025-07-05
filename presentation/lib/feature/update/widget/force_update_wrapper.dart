import 'package:flutter/material.dart';
import 'package:presentation/feature/update/widget/force_update_page.dart';

final class ForceUpdateWrapper extends StatelessWidget {
  final bool isForceUpdate;
  final Widget child;

  const ForceUpdateWrapper({
    super.key,
    required this.isForceUpdate,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isForceUpdate) ForceUpdatePage(),
        ],
      );
}
