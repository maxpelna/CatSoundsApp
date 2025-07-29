import 'package:domain/analytics/model/analytics_event_type.dart';
import 'package:domain/analytics/model/analytics_parameter_key_type.dart';
import 'package:equatable/equatable.dart';

final class AnalyticsLogData extends Equatable {
  final AnalyticsEventType event;
  final Map<AnalyticsParameterKeyType, Object>? parameters;

  const AnalyticsLogData({
    required this.event,
    this.parameters,
  });

  @override
  List<Object?> get props => [event, parameters];
}
