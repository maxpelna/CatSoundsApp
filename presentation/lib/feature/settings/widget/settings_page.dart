import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:lottie/lottie.dart';
import 'package:presentation/design/design_src.dart';
import 'package:presentation/feature/settings/widget/settings_item.dart';
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
    final secondaryTextColor = colors.text.secondaryOnLight;
    final thanksColor = colors.text.tertiaryOnLight;
    final thanksTextStyle = typography.subheadSemiBold.copyWith(
      color: thanksColor,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            hBox20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wBox16,
                Text(
                  localization.settings_title,
                  style: context.typography.largeTitleBold.copyWith(
                    color: secondaryTextColor,
                  ),
                ),
                const Spacer(),
                CsIconButton(
                  icon: Icons.close,
                  color: secondaryTextColor,
                  onPressed: _close,
                ),
                wBox8,
              ],
            ),
            hBox20,
            SettingsItem(
              name: localization.settings_terms,
              icon: Icons.account_balance,
              onTap: _openTermsAndConditions,
            ),
            hBox8,
            SettingsItem(
              name: localization.settings_policy,
              icon: Icons.privacy_tip_outlined,
              onTap: _openPrivacyPolicy,
            ),
            hBox8,
            SettingsItem(
              name: localization.settings_rate,
              icon: Icons.star,
              onTap: _rateApp,
            ),
            hBox8,
            SettingsItem(
              name: localization.settings_share_app,
              icon: Icons.ios_share,
              onTap: () => _shareApp(localization),
            ),
            const Spacer(),
            Center(
              child: Lottie.asset(
                context.assets.animations.thanks,
                width: context.totalWidth / 4,
              ),
            ),
            Padding(
              padding: allPadding16,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: localization.settings_animator_credit_first,
                      style: thanksTextStyle,
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: GestureDetector(
                        onTap: _openAnimationCreatorWeb,
                        behavior: HitTestBehavior.translucent,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Padding(
                              padding: bottomPadding8,
                              child: Text(
                                localization.settings_animator_credit_second,
                                style: thanksTextStyle,
                              ),
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                color: thanksColor,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: colors.background.background,
    );
  }

  void _close() {
    HapticFeedback.lightImpact();
    Navigator.of(context).pop();
  }

  void _openTermsAndConditions() {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnTerms));
    HapticFeedback.lightImpact();
    openWeb(url: AppUrls.terms);
  }

  void _openPrivacyPolicy() {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnPolicy));
    HapticFeedback.lightImpact();
    openWeb(url: AppUrls.privacyPolicy);
  }

  void _rateApp() async {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnRateApp));

    await HapticFeedback.lightImpact();
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  void _shareApp(AppLocalizations localization) {
    context.logEvent(AnalyticsLogData(event: AnalyticsEventType.tappedOnShareApp));
    HapticFeedback.lightImpact();

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
    HapticFeedback.lightImpact();
    openWeb(url: AppUrls.animatorCreatorLink);
  }
}
