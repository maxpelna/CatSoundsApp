import 'package:data/stats/model/stats_keys.dart';
import 'package:data/storage/shared_preferences_storage.dart';
import 'package:domain/stats/repository/stats_repository.dart';

final class StatsRepositoryImpl implements StatsRepository {
  final SharedPreferencesStorage _storage;

  const StatsRepositoryImpl({
    required SharedPreferencesStorage storage,
  }) : _storage = storage;

  @override
  Future<bool> get isPlaceholder async =>
      _storage.getBool(StatsKeys.placeholder) ?? true;

  @override
  Future<void> setIsPlaceholder(bool isFirstLaunch) async =>
      await _storage.setBool(
        StatsKeys.placeholder,
        isFirstLaunch,
      );
}
