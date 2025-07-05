import 'package:domain/locale/model/app_language.dart';

abstract interface class LocaleRepository {
  AppLanguage? get appLanguage;

  Future<void> setAppLanguage(AppLanguage locale);
}
