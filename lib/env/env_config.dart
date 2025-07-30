final class EnvConfig {
  static const isDevEnv = bool.fromEnvironment(
    'IS_DEV_ENV',
  );
}
