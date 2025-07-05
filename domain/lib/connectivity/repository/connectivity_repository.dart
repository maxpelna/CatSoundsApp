abstract interface class ConnectivityRepository {
  Stream<bool> get connectivityStream;

  Future<bool> isCurrentlyConnected();
}
