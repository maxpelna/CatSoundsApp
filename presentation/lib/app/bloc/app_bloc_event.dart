part of 'app_bloc.dart';

sealed class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object?> get props => [];
}

final class StartAppEvent extends AppBlocEvent {
  const StartAppEvent();
}
