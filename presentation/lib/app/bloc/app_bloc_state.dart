part of 'app_bloc.dart';

final class AppBlocState extends Equatable {
  final DelayedResult<bool> isConnected;
  final DelayedResult<UpdateConfig> updateConfig;

  const AppBlocState({
    required this.isConnected,
    required this.updateConfig,
  });

  AppBlocState copyWith({
    DelayedResult<bool>? isConnected,
    DelayedResult<UpdateConfig>? updateConfig,
  }) =>
      AppBlocState(
        isConnected: isConnected ?? this.isConnected,
        updateConfig: updateConfig ?? this.updateConfig,
      );

  @override
  List<Object?> get props => [
        isConnected,
        updateConfig,
      ];
}
