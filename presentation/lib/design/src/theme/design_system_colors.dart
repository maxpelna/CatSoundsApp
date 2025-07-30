// ignore_for_file: no-equal-arguments

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class DesignSystemColors extends Equatable {
  final BaseColors base;
  final TextColors text;
  final BackgroundColors background;
  final BorderColors border;

  const DesignSystemColors({
    required this.base,
    required this.text,
    required this.background,
    required this.border,
  });

  factory DesignSystemColors.light() => DesignSystemColors(
    base: BaseColors.light(),
    text: TextColors.light(),
    background: BackgroundColors.light(),
    border: BorderColors.light(),
  );

  factory DesignSystemColors.dark() => DesignSystemColors(
    base: BaseColors.light(),
    text: TextColors.light(),
    background: BackgroundColors.light(),
    border: BorderColors.light(),
  );

  @override
  List<Object?> get props => [
    base,
    text,
    background,
    border,
  ];
}

final class BaseColors extends Equatable {
  final Color primary;
  final Color onPrimary;

  const BaseColors({
    required this.primary,
    required this.onPrimary,
  });

  factory BaseColors.light() => const BaseColors(
    primary: Color(0xFFF7E1E1),
    onPrimary: Color(0xFFF4B69F),
  );

  @override
  List<Object?> get props => [
    primary,
    onPrimary,
  ];
}

final class TextColors extends Equatable {
  final Color primaryOnLight;
  final Color secondaryOnLight;
  final Color tertiaryOnLight;

  const TextColors({
    required this.primaryOnLight,
    required this.secondaryOnLight,
    required this.tertiaryOnLight,
  });

  factory TextColors.light() => const TextColors(
    primaryOnLight: Color(0xFF000000),
    secondaryOnLight: Color(0xFFFFFFFF),
    tertiaryOnLight: Color(0xFFDEE6EB),
  );

  @override
  List<Object?> get props => [
    primaryOnLight,
    secondaryOnLight,
    tertiaryOnLight,
  ];
}

final class BackgroundColors extends Equatable {
  final Color background;
  final Color surface;
  final Color onSurfacePressed;

  const BackgroundColors({
    required this.background,
    required this.surface,
    required this.onSurfacePressed,
  });

  factory BackgroundColors.light() => BackgroundColors(
    background: const Color(0xFF74a38a),
    surface: const Color(0xFFF8E6C7),
    onSurfacePressed: const Color(0xFF3C3551),
  );

  @override
  List<Object?> get props => [
    background,
    surface,
    onSurfacePressed,
  ];
}

final class BorderColors extends Equatable {
  final Color onSurface;

  const BorderColors({
    required this.onSurface,
  });

  factory BorderColors.light() => const BorderColors(
    onSurface: Color(0xFFFBEBD3),
  );

  @override
  List<Object?> get props => [
    onSurface,
  ];
}
