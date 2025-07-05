import 'package:fimber/fimber.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

// Fimber tree for logging non-fatal errors in release builds.
final class CrashlyticsFimberTree extends LogTree {
  // Only report Warnings and Errors.
  static const defaultLevels = ['W', 'E'];

  CrashlyticsFimberTree();

  @override
  void log(
    String level,
    String message, {
    String? tag,
    // Can be anything.
    // ignore: avoid-dynamic
    dynamic ex,
    StackTrace? stacktrace,
  }) {
    FirebaseCrashlytics.instance.log(message);
    FirebaseCrashlytics.instance.recordError(
      ex ?? Exception(message),
      stacktrace,
    );
  }

  @override
  List<String> getLevels() => defaultLevels;
}
