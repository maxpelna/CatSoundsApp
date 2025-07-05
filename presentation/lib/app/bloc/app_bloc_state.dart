part of 'app_bloc.dart';

final class AppBlocState extends Equatable {
  final AppFlowState appFlowState;

  const AppBlocState({
    required this.appFlowState,
  });

  AppBlocState copyWith({
    AppFlowState? appFlowState,
  }) => AppBlocState(
    appFlowState: appFlowState ?? this.appFlowState,
  );

  @override
  List<Object?> get props => [
    appFlowState,
  ];
}
