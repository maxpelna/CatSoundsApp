import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class ErrorFlash extends StatelessWidget {
  final FlashController controller;
  final String message;

  const ErrorFlash({
    super.key,
    required this.controller,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final bgColors = colors.background;

    return FlashBar(
      controller: controller,
      position: FlashPosition.top,
      dismissDirections: const [FlashDismissDirection.vertical],
      backgroundColor: bgColors.onDarkSurface.withValues(alpha: 0.01),
      shadowColor: Colors.transparent,
      // Not relevant.
      // ignore: no-equal-arguments
      surfaceTintColor: Colors.transparent,
      content: Container(
        decoration: BoxDecoration(
          color: bgColors.surface,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            style: typography.subheadRegular,
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
