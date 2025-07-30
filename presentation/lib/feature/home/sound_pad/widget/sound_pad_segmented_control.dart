import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class SoundPadSegmentedControl extends StatelessWidget {
  static const _height = 80.0;

  final int initialValue;
  final IntCallback onValueChanged;

  const SoundPadSegmentedControl({
    super.key,
    required this.initialValue,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final colors = context.colors;
    final typography = context.typography;
    final textStyle = typography.subheadSemiBold.copyWith(
      color: colors.text.primaryOnLight,
    );

    return SizedBox(
      height: _height,
      child: Padding(
        padding: hPadding16,
        child: CustomSlidingSegmentedControl<int>(
          onValueChanged: onValueChanged,
          initialValue: initialValue,
          innerPadding: allPadding8,
          decoration: BoxDecoration(
            color: colors.base.primary,
            borderRadius: borderAll20,
          ),
          thumbDecoration: BoxDecoration(
            color: colors.base.onPrimary,
            borderRadius: borderAll16,
          ),
          isStretch: true,
          children: {
            0: Text(
              localization.sound_pad_meow_type,
              style: textStyle,
            ),
            1: Text(
              localization.sound_pad_love_type,
              style: textStyle,
            ),
            2: Text(
              localization.sound_pad_anger_type,
              style: textStyle,
            ),
          },
        ),
      ),
    );
  }
}
