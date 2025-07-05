import 'package:collection/collection.dart';
import 'package:domain/locale/model/app_language.dart';
import 'package:domain/locale/repository/locale_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';
import 'package:presentation/locale/app_locale_switcher.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class AppLocaleManager extends StatefulWidget {
  final LocaleRepository localeRepository;
  final LocalizedWidgetBuilder builder;

  const AppLocaleManager({
    super.key,
    required this.localeRepository,
    required this.builder,
  });

  @override
  State<AppLocaleManager> createState() => _AppLocaleManagerState();
}

final class _AppLocaleManagerState extends State<AppLocaleManager> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loadLocale();
    });
  }

  @override
  Widget build(BuildContext context) => AppLocaleSwitcher(
        locale: _locale,
        onLocaleChanged: _updateLocale,
        child: Builder(
          builder: (context) => widget.builder(
            _locale,
          ),
        ),
      );

  // Return selected language -> system preferred language -> default language.
  void _loadLocale() {
    final defaultLanguageCode = AppLanguage.en.code;
    final systemLanguageCode =
        View.of(context).platformDispatcher.locales.firstOrNull?.languageCode;
    const supportedLocales = AppLocalizations.supportedLocales;

    try {
      final storedLanguageCode = widget.localeRepository.appLanguage?.code;
      final supportedSystemLanguageCode = supportedLocales
          .firstWhereOrNull(
            (language) => language.languageCode == systemLanguageCode,
          )
          ?.languageCode;
      final languageCode = storedLanguageCode ??
          supportedSystemLanguageCode ??
          defaultLanguageCode;

      _setLocale(Locale(languageCode));
    } on Exception catch (ex, st) {
      Fimber.w('Failed to get locale from disk: $ex', stacktrace: st);
      _setLocale(Locale(defaultLanguageCode));
    }
  }

  void _updateLocale(Locale locale) async {
    _setLocale(locale);

    try {
      final appLanguage = AppLanguage.values.firstWhereOrNull(
        (language) => language.code == locale.languageCode,
      );
      if (appLanguage != null) {
        await widget.localeRepository.setAppLanguage(appLanguage);
      }
    } on Exception catch (ex, st) {
      Fimber.w('Failed to set locale to disk: $ex', stacktrace: st);
    }
  }

  void _setLocale(Locale locale) => setState(() => _locale = locale);
}
