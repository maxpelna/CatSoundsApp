import 'package:domain/analytics/model/analytics_log_data.dart';
import 'package:domain/analytics/repository/analytics_repository.dart';
import 'package:flutter/cupertino.dart';

class AnalyticsEventLogger extends InheritedWidget {
  final AnalyticsRepository analyticsRepository;

  const AnalyticsEventLogger({
    super.key,
    required this.analyticsRepository,
    required super.child,
  });

  static void logEvent(BuildContext context, AnalyticsLogData log) {
    final result =
        context.dependOnInheritedWidgetOfExactType<AnalyticsEventLogger>();
    if (result == null) {
      throw 'No AnalyticsEventObserver found in context';
    }

    result.analyticsRepository.logEvent(log);
  }

  @override
  bool updateShouldNotify(covariant AnalyticsEventLogger oldWidget) =>
      this != oldWidget;
}
