import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';
import 'package:presentation/utils/extension/analytics_extension.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';
import 'package:presentation/web/app_urls.dart';
import 'package:presentation/web/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

final class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with UrlLauncher {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.typography;
    final localization = context.localization;

    return Scaffold(
      backgroundColor: colors.background.surface,
      body: SafeArea(
        child: Padding(
          padding: allPadding16,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.settings_title,
                    style: context.typography.largeTitleBold.copyWith(
                      color: colors.text.primaryOnDark,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(
                      Icons.close,
                      size: 32,
                      color: Colors.black.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              hBox20,
              _SettingsItem(
                name: localization.settings_terms,
                onTap: _openTermsAndConditions,
              ),
              hBox8,
              _SettingsItem(
                name: localization.settings_policy,
                onTap: _openPrivacyPolicy,
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
              Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: localization.settings_animator_credit_first,
                      style: typography.subheadSemiBold.copyWith(
                        color: colors.text.secondaryOnLight,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: _openAnimationCreatorWeb,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2), // padding between text and underline
                              child: Text(
                                localization.settings_animator_credit_second,
                                style: typography.subheadSemiBold.copyWith(
                                  color: colors.text.secondaryOnLight,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 1,
                                color: colors.text.secondaryOnLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openTermsAndConditions() {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnTerms));
    openWeb(url: AppUrls.terms);
  }

  void _openPrivacyPolicy() {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnPolicy));
    openWeb(url: AppUrls.privacyPolicy);
  }

  void _rateApp() async {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnRateApp));

    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  void _shareApp(AppLocalizations localization) {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnShareApp));

    SharePlus.instance.share(
      ShareParams(
        text: localization.settings_share_content(
          AppUrls.androidPlayStore,
          AppUrls.iOSAppStore,
        ),
      ),
    );
  }

  void _openAnimationCreatorWeb() {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnAnimatorCredit));
    openWeb(url: AppUrls.animatorCreatorLink);
  }
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
      child: CsTapBuilder(
        builder: (isTapped) => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: isTapped ? colors.background.onSurfacePressed : colors.background.onSurface,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: Padding(
            padding: hPadding16vPadding20,
            child: Text(
              name,
              style: typography.bodySemiBold.copyWith(
                color: colors.text.primaryOnDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
