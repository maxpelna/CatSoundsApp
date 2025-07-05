import 'dart:async';
import 'dart:isolate';
import 'package:cat_sounds/error/bloc_error_observer.dart';
import 'package:cat_sounds/error/crashlytics_fimber_tree.dart';
import 'package:fimber/fimber.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BootstrapCallback = FutureOr<Widget> Function();

Future<void> bootstrap(BootstrapCallback builder) async {
  _configureErrorLogging();

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      await _initFirebase();
      _initFimber();

      runApp(await builder());
    },
    (error, stackTrace) {
      Fimber.e('Uncaught error', ex: error, stacktrace: stackTrace);
    },
  );
}

void _configureErrorLogging() {
  FlutterError.onError = (details) {
    Fimber.e(
      'Flutter error',
      ex: details.exception,
      stacktrace: details.stack,
    );
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter
  // framework to Crashlytics.
  PlatformDispatcher.instance.onError = (error, stack) {
    Fimber.e('Fatal Flutter async error', ex: error, stacktrace: stack);

    return true;
  };

  Isolate.current.addErrorListener(
    RawReceivePort((pair) {
      // Ignored due to work with Isolates that returns dynamic values.
      // ignore: avoid-dynamic
      final List<dynamic> errorAndStacktrace = pair;
      Fimber.e(
        'Error outside of Flutter',
        ex: errorAndStacktrace.firstOrNull,
        stacktrace: errorAndStacktrace.lastOrNull,
      );
    }).sendPort,
  );

  Bloc.observer = const BlocErrorObserver();
}

Future<void> _initFirebase() async => await Firebase.initializeApp();

void _initFimber() {
  if (kReleaseMode) {
    Fimber.plantTree(CrashlyticsFimberTree());
  } else {
    Fimber.plantTree(DebugTree());
  }
}
