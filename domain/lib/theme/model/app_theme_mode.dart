enum AppThemeMode {
  system(0),
  light(1),
  dark(2);

  final int value;

  const AppThemeMode(this.value);

  factory AppThemeMode.fromRawValue(int rawValue) =>
      AppThemeMode.values.firstWhere(
        (item) => item.value == rawValue,
        orElse: () => AppThemeMode.system,
      );
}
