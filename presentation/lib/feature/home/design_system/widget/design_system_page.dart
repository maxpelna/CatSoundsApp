import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:domain/analytics/model/analytics_parameter_key_type.dart';
import 'package:domain/analytics/model/analytics_parameter_value_type.dart';
import 'package:domain/error/model/general_error.dart';
import 'package:domain/locale/model/app_language.dart';
import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:presentation/error/handler/error_handler.dart';
import 'package:presentation/error/mapper/error_mapper.dart';
import 'package:presentation/locale/app_locale_switcher.dart';
import 'package:presentation/theme/app_theme_switcher.dart';
import 'package:presentation/utils/extension/analytics_extension.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/web/app_urls.dart';
import 'package:presentation/web/url_launcher.dart';

// TODO: Add primary, secondary, icon buttons, input field.
final class DesignSystemPage extends StatefulWidget {
  const DesignSystemPage({super.key});

  @override
  State<DesignSystemPage> createState() => _DesignSystemPageState();
}

final class _DesignSystemPageState extends State<DesignSystemPage>
    with ErrorHandler, UrlLauncher {
  @override
  Widget build(BuildContext context) {
    final localization = context.localization;
    final colors = context.colors;
    final typography = context.typography;

    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                localization.placeholder,
                style: typography.bodyRegular.copyWith(
                  color: colors.text.primaryOnDark,
                ),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: _setLanguageToEn,
                child: Text('EN'),
              ),
              Spacer(),
              MaterialButton(
                onPressed: _setLanguageToLv,
                child: Text('LV'),
              ),
            ],
          ),
          Row(
            children: [
              Spacer(),
              MaterialButton(
                onPressed: _createAnalyticsEvent,
                child: Text('Send Firebase analytics event'),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              MaterialButton(
                onPressed: _setSystemThemeMode,
                child: Text('System'),
              ),
              Spacer(),
              MaterialButton(
                onPressed: _setDarkThemeMode,
                child: Text('Dark'),
              ),
              Spacer(),
              MaterialButton(
                onPressed: _setLightThemeMode,
                child: Text('Light'),
              ),
            ],
          ),
          Row(
            children: [
              Spacer(),
              MaterialButton(
                onPressed: _showFlash,
                child: Text('Send error with flash'),
              ),
              Spacer(),
            ],
          ),
          Row(
            children: [
              Spacer(),
              MaterialButton(
                onPressed: _openWebView,
                child: Text('Open web view'),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
      backgroundColor: colors.background.background,
    );
  }

  void _createAnalyticsEvent() {
    context.logEvent(
      AnalyticsLogData(
        event: AnalyticsEventType.placeholder,
        parameters: {
          AnalyticsParameterKeyType.elementId:
              AnalyticsParameterValueType.elementValue,
        },
      ),
    );
  }

  void _setLanguageToEn() {
    AppLocaleSwitcher.setLanguage(context, AppLanguage.en);
  }

  void _setLanguageToLv() {
    AppLocaleSwitcher.setLanguage(context, AppLanguage.lv);
  }

  void _setSystemThemeMode() {
    AppThemeSwitcher.setMode(context, AppThemeMode.system);
  }

  void _setDarkThemeMode() {
    AppThemeSwitcher.setMode(context, AppThemeMode.dark);
  }

  void _setLightThemeMode() {
    AppThemeSwitcher.setMode(context, AppThemeMode.light);
  }

  void _showFlash() {
    final error = ErrorMapper.toMessage(
      context.localization,
      error: GeneralError(),
    );
    showErrorMessage(context, error: error);
  }

  void _openWebView() {
    openWeb(url: AppUrls.placeholder);
  }
}
