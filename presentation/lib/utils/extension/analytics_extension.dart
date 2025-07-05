import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:flutter/material.dart';
import 'package:presentation/analytics/analytics_event_logger.dart';

extension AnalyticsExtension on BuildContext {
  void logEvent(AnalyticsLogData log) =>
      AnalyticsEventLogger.logEvent(this, log);
}
