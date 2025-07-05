import 'package:equatable/equatable.dart';

final class RcUpdateConfig extends Equatable {
  final String latestAppVersion;
  final bool isForceUpdate;

  const RcUpdateConfig({
    required this.latestAppVersion,
    required this.isForceUpdate,
  });

  @override
  List<Object?> get props => [
    latestAppVersion,
        isForceUpdate,
      ];
}
