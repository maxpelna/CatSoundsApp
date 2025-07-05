import 'package:flutter/material.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return Scaffold(
      body: Center(
        child: Text(
          'Login Page',
          style: typography.bodyRegular.copyWith(
            color: colors.text.primaryOnDark,
          ),
        ),
      ),
      backgroundColor: colors.background.background,
    );
  }
}
