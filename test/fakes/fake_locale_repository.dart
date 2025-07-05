import 'package:domain/locale/model/app_language.dart';
import 'package:domain/locale/repository/locale_repository.dart';

final class FakeLocaleRepository implements LocaleRepository {
  var testAppLanguage = AppLanguage.en;

  @override
  AppLanguage? get appLanguage => testAppLanguage;

  @override
  Future<void> setAppLanguage(AppLanguage locale) {
    throw UnimplementedError();
  }
}
