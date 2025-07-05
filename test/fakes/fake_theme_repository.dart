import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';

final class FakeThemeRepository implements ThemeRepository {
  var testThemeMode = AppThemeMode.light;

  @override
  AppThemeMode get themeMode => testThemeMode;

  @override
  Future<void> setThemeMode(AppThemeMode mode) {
    throw UnimplementedError();
  }
}
