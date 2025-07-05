import 'package:equatable/equatable.dart' show Equatable;
import 'package:fimber/fimber.dart' show Fimber;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_flow_state.dart';

final class AppFlowCubit extends Cubit<AppFlowState> {
  AppFlowCubit() : super(AppLoadingState());

  // Listen to the authentication state changes and emit launch state
  //late final StreamSubscription _streamSubscription;
  //void _listenSessionStatus() =>
  //    _streamSubscription = Stream.value(AuthenticatedState()).listen(emit);
  //
  //
  //@override
  //Future<void> close() {
  //  _streamSubscription.cancel();
  //
  //  return super.close();
  //}.

  Future<void> refreshLaunchState() async {
    try {
      final appLaunchState = await _appLaunchState;

      emit(appLaunchState);
    } on Exception catch (ex, st) {
      Fimber.e('Failed to refresh launch state', ex: ex, stacktrace: st);
      emit(const NotAuthenticatedState());
    }
  }

  // TODO: Handle user global state to determine app launch state.
  Future<AppFlowState> get _appLaunchState async {
    // As this is a mock implementation, we simulate a delay
    // If launch state is not anyhow handled then whole coordinator is not needed and can be removed from project.
    await Future.delayed(const Duration(seconds: 1));
    try {
      return const AuthenticatedState();
    } on Exception catch (ex, _) {
      return const NotAuthenticatedState();
    }
  }
}
