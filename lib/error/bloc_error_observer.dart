import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class BlocErrorObserver extends BlocObserver {
  const BlocErrorObserver();

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Fimber.w('${bloc.runtimeType} err: $error', stacktrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
