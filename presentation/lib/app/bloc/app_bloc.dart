import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/coordinator/bloc/app_flow_state.dart';

part 'app_bloc_event.dart';
part 'app_bloc_state.dart';

final class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  final Duration _splashDuration;

  AppBloc({required Duration splashDuration})
    : _splashDuration = splashDuration,
      super(
        const AppBlocState(
          appFlowState: AppLoadingState(),
        ),
      ) {
    on<StartAppEvent>(_onStartApp);
  }

  Future<void> _onStartApp(
    StartAppEvent event,
    Emitter emit,
  ) async {
    await Future.delayed(_splashDuration);

    emit(state.copyWith(appFlowState: AuthenticatedState()));
  }
}
