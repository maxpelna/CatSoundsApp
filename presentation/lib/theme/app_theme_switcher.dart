import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class AppThemeSwitcher extends InheritedWidget {
  final ThemeRepository themeRepository;
  final AppThemeModeCallback onThemeSwitch;
  final AppThemeMode? mode;

  const AppThemeSwitcher({
    super.key,
    required this.themeRepository,
    required this.onThemeSwitch,
    required this.mode,
    required super.child,
  });

  @override
  bool updateShouldNotify(AppThemeSwitcher oldWidget) => oldWidget != this;

  static void setMode(BuildContext context, AppThemeMode mode) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppThemeSwitcher>();
    if (result == null) {
      throw 'No AppThemeMode found in context';
    }

    result.themeRepository.setThemeMode(mode);
    result.onThemeSwitch(mode);
  }

  static AppThemeMode getMode(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppThemeSwitcher>();
    if (result == null) {
      throw 'No AppThemeMode found in context';
    }

    return result.mode ?? AppThemeMode.system;
  }
}
