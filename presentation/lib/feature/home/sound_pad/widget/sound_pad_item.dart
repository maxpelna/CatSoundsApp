import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/utils/extension/color_extension.dart';

final class SoundPadItem extends StatelessWidget {
  static const _iconSize = 40.0;

  final String name;
  final bool isActive;
  final VoidCallback onTap;

  const SoundPadItem({
    super.key,
    required this.name,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final backgroundColor = isActive ? colors.base.onPrimary : colors.base.primary;
    final contentColor = isActive ? colors.text.secondaryOnLight : colors.text.primaryOnLight;

    return GestureDetector(
      onTap: isActive ? null : () => onTap(),
      behavior: HitTestBehavior.translucent,
      child: CsTapBuilder(
        builder: (isTapped) {
          final scale = isTapped ? 0.9 : 1.0;

          return Transform.scale(
            scale: scale,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: colors.border.onSurface, width: 4),
                borderRadius: borderAll20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(
                    name,
                    style: typography.title1Bold.copyWith(
                      color: contentColor,
                    ),
                  ),
                  SvgPicture.asset(
                    context.assets.icons.icPaw,
                    width: _iconSize,
                    height: _iconSize,
                    colorFilter: contentColor.colorFilter,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
