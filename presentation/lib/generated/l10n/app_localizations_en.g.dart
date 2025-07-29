// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.g.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get placeholder => 'Test in English';

  @override
  String get sound_pad_meow_type => 'Meow';

  @override
  String get sound_pad_love_type => 'Love';

  @override
  String get sound_pad_anger_type => 'Anger';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_terms => 'Terms and Conditions';

  @override
  String get settings_policy => 'Privacy Policy';

  @override
  String get settings_rate => 'Rate this app';

  @override
  String get settings_share_app => 'Share this app';

  @override
  String settings_share_content(Object android, Object ios) {
    return 'Check out this app\n\n iOS: $ios \n\n Android: $android';
  }

  @override
  String get settings_animator_credit_first => 'The animation of cat is done by ';

  @override
  String get settings_animator_credit_second => 'hicaro.lima';
}
