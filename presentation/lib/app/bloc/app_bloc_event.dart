part of 'app_bloc.dart';

sealed class AppBlocEvent extends Equatable {
  const AppBlocEvent();

  @override
  List<Object?> get props => [];
}

final class ListenToConnectionStatusEvent extends AppBlocEvent {
  const ListenToConnectionStatusEvent();
}

final class ListenUpdateConfigStatusEvent extends AppBlocEvent {
  const ListenUpdateConfigStatusEvent();
}
