import 'package:flutter/material.dart';
import 'package:presentation/design/src/theme/design_system_theme_data.dart';

final class DesignSystemTheme extends InheritedWidget {
  final DesignSystemThemeData lightSystemData;
  final DesignSystemThemeData darkSystemData;
  final bool isDarkMode;
  final bool isTestEnv;

  const DesignSystemTheme({
    super.key,
    required this.lightSystemData,
    required this.darkSystemData,
    required this.isDarkMode,
    required this.isTestEnv,
    required super.child,
  });

  static DesignSystemThemeData of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<DesignSystemTheme>();
    if (result == null) {
      throw 'No DesignSystem found in context';
    }

    return result.isDarkMode ? result.darkSystemData : result.lightSystemData;
  }

  static bool isTest(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<DesignSystemTheme>();
    if (result == null) {
      throw 'No DesignSystem found in context';
    }

    return result.isTestEnv;
  }

  static bool isDarkTheme(BuildContext context) {
    final result =
    context.dependOnInheritedWidgetOfExactType<DesignSystemTheme>();
    if (result == null) {
      throw 'No DesignSystem found in context';
    }

    return result.isDarkMode;
  }

  @override
  bool updateShouldNotify(DesignSystemTheme oldWidget) =>
      lightSystemData != oldWidget.lightSystemData ||
      darkSystemData != oldWidget.darkSystemData ||
      isDarkMode != oldWidget.isDarkMode ||
      isTestEnv != oldWidget.isTestEnv;
}
