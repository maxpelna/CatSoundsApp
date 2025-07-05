import 'package:domain/theme/model/app_theme_mode.dart';

abstract interface class ThemeRepository {
  AppThemeMode get themeMode;

  Future<void> setThemeMode(AppThemeMode mode);
}
