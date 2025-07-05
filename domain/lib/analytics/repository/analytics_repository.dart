import 'package:domain/analytics/model/analytics_log_data.dart';

abstract interface class AnalyticsRepository {
  void logEvent(AnalyticsLogData log);
}
