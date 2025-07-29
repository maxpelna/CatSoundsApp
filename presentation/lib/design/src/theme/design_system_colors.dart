// ignore_for_file: no-equal-arguments

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class DesignSystemColors extends Equatable {
  final BaseColors base;
  final TextColors text;
  final BackgroundColors background;
  final BorderColors border;
  final StateColors state;
  final DecorativeColors decorative;

  const DesignSystemColors({
    required this.base,
    required this.text,
    required this.background,
    required this.border,
    required this.state,
    required this.decorative,
  });

  factory DesignSystemColors.light() => DesignSystemColors(
    base: BaseColors.light(),
    text: TextColors.light(),
    background: BackgroundColors.light(),
    border: BorderColors.light(),
    state: StateColors.light(),
    decorative: DecorativeColors.light(),
  );

  factory DesignSystemColors.dark() => DesignSystemColors(
    base: BaseColors.dark(),
    text: TextColors.dark(),
    background: BackgroundColors.dark(),
    border: BorderColors.dark(),
    state: StateColors.dark(),
    decorative: DecorativeColors.dark(),
  );

  @override
  List<Object?> get props => [
    base,
    text,
    background,
    border,
    state,
    decorative,
  ];
}

final class BaseColors extends Equatable {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;

  const BaseColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
  });

  factory BaseColors.light() => const BaseColors(
    primary: Color(0xFF000000),
    onPrimary: Color(0xFF020202),
    secondary: Color(0xFF040404),
    onSecondary: Color(0xFF080808),
  );

  factory BaseColors.dark() => const BaseColors(
    primary: Color(0xFFFFFFFF),
    onPrimary: Color(0xFFF2F2F2),
    secondary: Color(0xFFF4F4F4),
    onSecondary: Color(0xFFF8F8F8),
  );

  @override
  List<Object?> get props => [
    primary,
    onPrimary,
    secondary,
    onSecondary,
  ];
}

final class TextColors extends Equatable {
  final Color primaryOnLight;
  final Color secondaryOnLight;
  final Color tertiaryOnLight;
  final Color primaryOnDark;

  const TextColors({
    required this.primaryOnLight,
    required this.secondaryOnLight,
    required this.tertiaryOnLight,
    required this.primaryOnDark,
  });

  factory TextColors.light() => const TextColors(
    primaryOnLight: Color(0xFF000000),
    secondaryOnLight: Color(0xFF020202),
    tertiaryOnLight: Color(0xFF040404),
    primaryOnDark: Color(0xFF080808),
  );

  factory TextColors.dark() => const TextColors(
    primaryOnLight: Color(0xFFFFFFFF),
    secondaryOnLight: Color(0xFFF2F2F2),
    tertiaryOnLight: Color(0xFFF4F4F4),
    primaryOnDark: Color(0xFFF8F8F8),
  );

  @override
  List<Object?> get props => [
    primaryOnLight,
    secondaryOnLight,
    tertiaryOnLight,
    primaryOnDark,
  ];
}

final class BackgroundColors extends Equatable {
  final Color background;
  final Color surface;
  final Color onSurface;
  final Color onSurfacePressed;

  const BackgroundColors({
    required this.background,
    required this.surface,
    required this.onSurface,
    required this.onSurfacePressed,
  });

  factory BackgroundColors.light() => BackgroundColors(
    background: const Color(0xFFFFFFFF),
    surface: const Color(0xFFA2A2A2),
    onSurface: const Color(0xFFA4A4A4),
    onSurfacePressed: const Color(0xFFAFFFFF),
  );

  factory BackgroundColors.dark() => BackgroundColors(
    background: const Color(0xFF101010),
    surface: const Color(0xFF121212),
    onSurface: const Color(0xFF141414),
    onSurfacePressed: const Color(0xFFAFFFFF),
  );

  @override
  List<Object?> get props => [
    background,
    surface,
    onSurface,
    onSurfacePressed,
  ];
}

final class BorderColors extends Equatable {
  final Color onBackground;
  final Color onSurface;

  const BorderColors({
    required this.onBackground,
    required this.onSurface,
  });

  factory BorderColors.light() => const BorderColors(
    onBackground: Color(0xFFFFFFFF),
    onSurface: Color(0xFFF0F0F0),
  );

  factory BorderColors.dark() => const BorderColors(
    onBackground: Color(0xFF3B3B3B),
    onSurface: Color(0xFF4D4D4D),
  );

  @override
  List<Object?> get props => [
    onBackground,
    onSurface,
  ];
}

final class StateColors extends Equatable {
  final Color primaryButtonPressed;
  final Color primaryButtonDisabled;
  final Color constantWhite;
  final Color constantBlack;

  const StateColors({
    required this.primaryButtonPressed,
    required this.primaryButtonDisabled,
    required this.constantWhite,
    required this.constantBlack,
  });

  factory StateColors.light() => StateColors(
    primaryButtonPressed: const Color(0xFF292929),
    primaryButtonDisabled: const Color(0xFFA9A7A7),
    constantWhite: const Color(0xFFFFFFFF),
    constantBlack: const Color(0xFF000000),
  );

  factory StateColors.dark() => StateColors(
    primaryButtonPressed: const Color(0xFFDBDBDB),
    primaryButtonDisabled: const Color(0xFF9B9B9B),
    constantWhite: const Color(0xFFFFFFFF),
    constantBlack: const Color(0xFF000000),
  );

  @override
  List<Object?> get props => [
    primaryButtonPressed,
    primaryButtonDisabled,
    constantWhite,
    constantBlack,
  ];
}

final class DecorativeColors extends Equatable {
  final Color success;

  const DecorativeColors({
    required this.success,
  });

  factory DecorativeColors.light() => const DecorativeColors(
    success: Color(0xFFCFF6CC),
  );

  factory DecorativeColors.dark() => const DecorativeColors(
    success: Color(0xFFCFF6CC),
  );

  @override
  List<Object?> get props => [
    success,
  ];
}
