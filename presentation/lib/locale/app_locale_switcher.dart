import 'package:collection/collection.dart';
import 'package:domain/locale/model/app_language.dart';
import 'package:flutter/material.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class AppLocaleSwitcher extends InheritedWidget {
  final Locale? locale;
  final LocaleCallback onLocaleChanged;

  const AppLocaleSwitcher({
    super.key,
    required this.locale,
    required this.onLocaleChanged,
    required super.child,
  });

  static void setLanguage(
    BuildContext context,
    AppLanguage language,
  ) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppLocaleSwitcher>();
    if (result == null) {
      throw 'No AppLocaleSwitcher found in context';
    }

    result.onLocaleChanged(Locale(language.code));
  }

  static AppLanguage getLanguage(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AppLocaleSwitcher>();
    if (result == null) {
      throw 'No AppLocaleSwitcher found in context';
    }

    const supportedLanguages = AppLanguage.values;
    const defaultSupportedLanguage = AppLanguage.en;

    final locale = result.locale;
    final selectedSupportedLanguage = supportedLanguages.firstWhereOrNull(
      (language) => language.code == locale?.languageCode,
    );

    return selectedSupportedLanguage ?? defaultSupportedLanguage;
  }

  @override
  bool updateShouldNotify(AppLocaleSwitcher oldWidget) => this != oldWidget;
}
