final class EnvConfig {
  static const apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
  );

  static const enableDebugView = bool.fromEnvironment(
    'ENABLE_DEBUG_VIEW',
  );

  static const isDevEnv = bool.fromEnvironment(
    'IS_DEV_ENV',
  );
}
