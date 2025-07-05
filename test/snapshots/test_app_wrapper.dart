import 'package:domain/locale/model/app_language.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:chili_text_scale_factor/chili_text_scale_factor.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';

WidgetWrapper testMaterialWrapper({
  required double textScaleFactor,
  required bool isDarkMode,
  required AppLanguage appLanguage,
}) =>
    (child) => DesignSystemTheme(
          lightSystemData: DesignSystemThemeData.light(textScaleFactor),
          darkSystemData: DesignSystemThemeData.dark(textScaleFactor),
          isDarkMode: isDarkMode,
          isTestEnv: true,
          child: MaterialApp(
            home: child,
            builder: (_, widget) => LimitTextScaleFactorWrapper(
              child: widget ?? emptyWidget,
            ),
            title: 'Test',
            locale: Locale(appLanguage.code),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        );
