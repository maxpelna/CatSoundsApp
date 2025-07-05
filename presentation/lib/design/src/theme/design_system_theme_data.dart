import 'package:equatable/equatable.dart';
import 'package:chili_text_scale_factor/chili_text_scale_factor.dart';
import 'package:presentation/design/src/theme/design_system_colors.dart';
import 'package:presentation/design/src/theme/design_system_typography.dart';

final class DesignSystemThemeData extends Equatable {
  final DesignSystemTypography typography;
  final DesignSystemColors colors;

  const DesignSystemThemeData({
    required this.typography,
    required this.colors,
  });

  factory DesignSystemThemeData.light(double textScaleFactor) {
    final colors = DesignSystemColors.light();
    final textScaleFactorStyle = TextScaleFactorStyle.fromTextScaleFactor(
      textScaleFactor,
    );
    final typography = DesignSystemTypography.main(
      defaultTextColor: colors.text.primaryOnLight,
      scaleStyle: textScaleFactorStyle,
    );

    return DesignSystemThemeData(
      typography: typography,
      colors: colors,
    );
  }

  factory DesignSystemThemeData.dark(double textScaleFactor) {
    final colors = DesignSystemColors.dark();
    final textScaleFactorStyle = TextScaleFactorStyle.fromTextScaleFactor(
      textScaleFactor,
    );
    final typography = DesignSystemTypography.main(
      defaultTextColor: colors.text.primaryOnLight,
      scaleStyle: textScaleFactorStyle,
    );

    return DesignSystemThemeData(
      typography: typography,
      colors: colors,
    );
  }

  @override
  List<Object?> get props => [
        typography,
        colors,
      ];
}
