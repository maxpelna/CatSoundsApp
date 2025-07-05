import 'package:equatable/equatable.dart';

sealed class AppFlowState extends Equatable {
  const AppFlowState();

  @override
  List<Object?> get props => [];
}

final class AppLoadingState extends AppFlowState {
  const AppLoadingState();
}

final class AuthenticatedState extends AppFlowState {
  const AuthenticatedState();
}
