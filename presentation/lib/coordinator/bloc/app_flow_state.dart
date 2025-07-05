part of 'app_flow_cubit.dart';

sealed class AppFlowState extends Equatable {
  const AppFlowState();

  @override
  List<Object?> get props => [];
}

final class AppLoadingState extends AppFlowState {
  const AppLoadingState();
}

final class NotAuthenticatedState extends AppFlowState {
  const NotAuthenticatedState();
}

final class AuthenticatedState extends AppFlowState {
  const AuthenticatedState();
}
