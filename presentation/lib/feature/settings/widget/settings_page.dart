import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/web/app_urls.dart';
import 'package:presentation/web/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

final class SettingsPage extends StatelessWidget with UrlLauncher {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final localization = context.localization;

    return Scaffold(
      backgroundColor: colors.background.onDarkSurface,
      appBar: AppBar(
        backgroundColor: colors.background.onDarkSurface,
        elevation: 0,
        title: Text(
          localization.settings_title,
          style: context.typography.largeTitleBold.copyWith(
            color: colors.text.primaryOnDark,
          ),
        ),
        leading: Text(""),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: colors.text.primaryOnDark,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: allPadding8,
          child: Column(
            children: [
              hBox8,
              _SettingsItem(
                name: localization.settings_terms,
                onTap: _openTermsAndConditions,
              ),
              hBox8,
              _SettingsItem(
                name: localization.settings_rate,
                onTap: _rateApp,
              ),
              hBox8,
              _SettingsItem(
                name: localization.settings_share_app,
                onTap: () => _shareApp(localization),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openTermsAndConditions() => openWeb(url: AppUrls.terms);

  void _rateApp() async {
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  void _shareApp(AppLocalizations localization) => SharePlus.instance.share(
    ShareParams(
      text: localization.settings_share_content(
        AppUrls.androidPlayStore,
        AppUrls.iOSAppStore,
      ),
    ),
  );
}

final class _SettingsItem extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const _SettingsItem({
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.background.onSurface,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: hPadding16vPadding8,
          child: Text(
            name,
            style: typography.bodySemiBold.copyWith(
              color: colors.text.primaryOnDark,
            ),
          ),
        ),
      ),
    );
  }
}
