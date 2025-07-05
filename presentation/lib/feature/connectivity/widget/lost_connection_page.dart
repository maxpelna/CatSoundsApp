import 'package:flutter/material.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class LostConnectionPage extends StatelessWidget {
  const LostConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: Center(
        child: Text(
          'Lost connection',
          style: context.typography.largeTitleBold,
        ),
      ),
      backgroundColor: colors.background.surface,
    );
  }
}
