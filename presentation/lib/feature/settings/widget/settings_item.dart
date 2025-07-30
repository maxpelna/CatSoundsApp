import 'package:flutter/material.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

final class SettingsItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return Padding(
      padding: hPadding16,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: CsTapBuilder(
          builder: (isTapped) {
            final backgroundColor = isTapped ? colors.base.onPrimary : colors.base.primary;
            final contentColor = isTapped ? colors.text.secondaryOnLight : colors.text.primaryOnLight;

            return Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderAll16,
              ),
              width: double.infinity,
              child: Padding(
                padding: allPadding16,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: contentColor,
                    ),
                    wBox8,
                    Text(
                      name,
                      style: typography.headlineSemiBold.copyWith(
                        color: contentColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
