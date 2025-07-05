import 'package:domain/update/model/update_status.dart';
import 'package:equatable/equatable.dart';

final class UpdateConfig extends Equatable {
  final String version;
  final UpdateStatus status;

  const UpdateConfig({
    required this.version,
    required this.status,
  });

  @override
  List<Object?> get props => [
        version,
        status,
      ];
}
