import 'package:domain/theme/model/app_theme_mode.dart';
import 'package:domain/theme/repository/theme_repository.dart';
import 'package:flutter/material.dart';
import 'package:presentation/design/src/theme/design_system_theme.dart';
import 'package:presentation/design/src/theme/design_system_theme_data.dart';
import 'package:presentation/di/di.dart';
import 'package:presentation/theme/app_theme_switcher.dart';
import 'package:presentation/utils/typedef/typedefs.dart';

final class AppThemeManager extends StatefulWidget {
  final bool isTestEnv;
  final double textScaleFactor;
  final ThemedWidgetBuilder builder;

  const AppThemeManager({
    super.key,
    required this.isTestEnv,
    required this.textScaleFactor,
    required this.builder,
  });

  @override
  State<AppThemeManager> createState() => _AppThemeManagerState();
}

final class _AppThemeManagerState extends State<AppThemeManager>
    with WidgetsBindingObserver {
  late final ThemeRepository _themeRepository;

  late bool _isDarkModeFromDevice;
  AppThemeMode? _themeMode;

  @override
  void initState() {
    super.initState();

    _themeRepository = diContainer.get<ThemeRepository>();

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.handlePlatformBrightnessChanged();

    // Is necessary for system brightness change.
    // ignore: avoid-unnecessary-setstate
    _setUpAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    final lightDesignSystemData = DesignSystemThemeData.light(
      widget.textScaleFactor,
    );
    final darkDesignSystemData = DesignSystemThemeData.dark(
      widget.textScaleFactor,
    );
    final brightness = _isDarkMode ? Brightness.dark : Brightness.light;

    return AppThemeSwitcher(
      themeRepository: _themeRepository,
      onThemeSwitch: _setThemeMode,
      mode: _themeMode,
      child: DesignSystemTheme(
        lightSystemData: lightDesignSystemData,
        darkSystemData: darkDesignSystemData,
        isDarkMode: _isDarkMode,
        isTestEnv: widget.isTestEnv,
        child: Builder(
          builder: (_) => widget.builder(
            _isDarkMode ? darkDesignSystemData : lightDesignSystemData,
            brightness,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool get _isDarkMode =>
      _themeMode == AppThemeMode.dark ||
      (_themeMode == AppThemeMode.system && _isDarkModeFromDevice);

  void _setUpAppTheme() {
    final dispatcher = WidgetsBinding.instance.platformDispatcher;

    // To trigger initial theme setup.
    _isDarkModeFromDevice = dispatcher.platformBrightness == Brightness.dark;

    final themeMode = _themeRepository.themeMode;
    _setThemeMode(themeMode);

    // Callback is called every time the brightness changes.
    dispatcher.onPlatformBrightnessChanged = () {
      setState(() {
        _isDarkModeFromDevice =
            dispatcher.platformBrightness == Brightness.dark;
      });
    };
  }

  void _setThemeMode(AppThemeMode theme) => setState(() => _themeMode = theme);
}
