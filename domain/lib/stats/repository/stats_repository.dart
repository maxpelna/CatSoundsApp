abstract interface class StatsRepository {
  Future<bool> get isPlaceholder;

  Future<void> setIsPlaceholder(bool isPlaceholder);
}
