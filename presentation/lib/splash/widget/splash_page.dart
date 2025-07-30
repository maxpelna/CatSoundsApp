import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Lottie.asset(
        context.assets.animations.splash,
        repeat: true,
      ),
    ),
    backgroundColor: context.colors.background.surface,
  );
}
