import 'package:delayed_result/delayed_result.dart';
import 'package:domain/connectivity/repository/connectivity_repository.dart';
import 'package:domain/remote_config/repository/remote_config_repository.dart';
import 'package:domain/update/model/update_config.dart';
import 'package:domain/update/repository/update_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_bloc_event.dart';

part 'app_bloc_state.dart';

final class AppBloc extends Bloc<AppBlocEvent, AppBlocState> {
  final ConnectivityRepository _connectivityRepository;
  final RemoteConfigRepository _remoteConfigRepository;
  final UpdateRepository _updateRepository;

  AppBloc({
    required ConnectivityRepository connectivityRepository,
    required RemoteConfigRepository remoteConfigRepository,
    required UpdateRepository updateRepository,
  }) : _connectivityRepository = connectivityRepository,
       _remoteConfigRepository = remoteConfigRepository,
       _updateRepository = updateRepository,
       super(
         const AppBlocState(
           isConnected: DelayedResult<bool>.fromValue(true),
           updateConfig: DelayedResult<UpdateConfig>.none(),
         ),
       ) {
    on<ListenToConnectionStatusEvent>(_onListenToConnectionStatus);
    on<ListenUpdateConfigStatusEvent>(_onListenUpdateConfigStatus);
  }

  Future<void> _onListenToConnectionStatus(
    ListenToConnectionStatusEvent event,
    Emitter emit,
  ) async => await emit.onEach(
    _connectivityRepository.connectivityStream,
    onData: (isConnected) =>
        emit(state.copyWith(isConnected: DelayedResult.fromValue(isConnected))),
  );

  Future<void> _onListenUpdateConfigStatus(
    ListenUpdateConfigStatusEvent event,
    Emitter emit,
  ) async => await emit.onEach(
    _remoteConfigRepository.rcUpdateConfigStream,
    onData: (rcUpdateConfig) {
      final updateConfig = _updateRepository.validateRcUpdateConfig(
        config: rcUpdateConfig,
      );

      emit(state.copyWith(updateConfig: DelayedResult.fromValue(updateConfig)));
    },
  );
}
