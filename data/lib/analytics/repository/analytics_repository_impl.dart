import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:domain/analytics/repository/analytics_repository.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final FirebaseAnalytics _analytics;

  const AnalyticsRepositoryImpl({
    required FirebaseAnalytics analytics,
  }) : _analytics = analytics;

  @override
  void logEvent(AnalyticsLogData log) => _analytics.logEvent(
        name: log.event.name,
        parameters: log.parameters?.map(
          (key, value) => MapEntry(key.name, value),
        ),
      );
}
