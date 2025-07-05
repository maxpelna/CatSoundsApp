import 'package:domain/remote_config/model/rc_update_config.dart';
import 'package:domain/update/model/update_config.dart';

abstract interface class UpdateRepository {
  UpdateConfig validateRcUpdateConfig({
    required RcUpdateConfig config,
  });
}
