import 'package:flutter/material.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/generated/assets/assets.gen.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';

extension BuildContextExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this);

  DesignSystemThemeData get _theme => DesignSystemTheme.of(this);

  bool get isTestEnv => DesignSystemTheme.isTest(this);

  bool get isDarkMode => DesignSystemTheme.isDarkTheme(this);

  EdgeInsets get _viewPadding => MediaQuery.paddingOf(this);

  EdgeInsets get _viewInsets => MediaQuery.viewInsetsOf(this);

  Size get totalSize => MediaQuery.sizeOf(this);

  $ResourcesAssetsGen get assets => Assets.resources.assets;

  DesignSystemColors get colors => _theme.colors;

  DesignSystemTypography get typography => _theme.typography;

  double get topSafeArea => _viewPadding.top;

  double get bottomSafeArea => _viewPadding.bottom;

  double get leftSafeArea => _viewPadding.left;

  double get rightSafeArea => _viewPadding.right;

  double get keyboardHeight => _viewInsets.bottom;

  double get totalWidth => totalSize.width;

  double get totalHeight => totalSize.height;

  TargetPlatform get _platform => Theme.of(this).platform;

  bool get isIos => _platform == TargetPlatform.iOS;

  // Used within context.
  // ignore: banned-usage
  DateTime get now => DateTime.now();
}
