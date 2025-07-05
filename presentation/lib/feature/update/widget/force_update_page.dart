import 'package:flutter/material.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class ForceUpdatePage extends StatelessWidget {
  const ForceUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: Center(
        child: Text(
          'Force update',
          style: context.typography.largeTitleBold,
        ),
      ),
      backgroundColor: colors.background.surface,
    );
  }
}
