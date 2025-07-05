import 'package:domain/locale/model/app_language.dart';
import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/design/src/theme/design_system_theme_data.dart';

// MARK: Callbacks.

typedef StringCallback = Function(String value);

typedef BoolCallback = Function(bool value);

typedef IntCallback = Function(int value);

typedef DoubleCallback = Function(double value);

typedef AppThemeModeCallback = Function(AppThemeMode mode);

typedef AppLanguageCallback = Function(AppLanguage language);

typedef LocaleCallback = Function(Locale locale);

// MARK: Builders.

typedef LocalizedWidgetBuilder = Widget Function(Locale? locale);

typedef ThemedWidgetBuilder =
    Widget Function(
      DesignSystemThemeData? themeData,
      Brightness brightness,
    );

typedef BoolWidgetBuilder = Widget Function(bool value);

typedef RouterWidgetBuilder = Widget Function(GoRouter router);
