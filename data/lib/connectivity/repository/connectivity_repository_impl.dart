import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:domain/connectivity/repository/connectivity_repository.dart';

final class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final _connectivity = Connectivity();

  @override
  Stream<bool> get connectivityStream =>
      _connectivity.onConnectivityChanged.distinct().map(
            (result) =>
                result.contains(ConnectivityResult.mobile) ||
                result.contains(ConnectivityResult.wifi),
          );

  @override
  Future<bool> isCurrentlyConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}
