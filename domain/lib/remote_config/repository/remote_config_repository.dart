import 'package:domain/remote_config/model/rc_update_config.dart';

abstract interface class RemoteConfigRepository {
  Stream<RcUpdateConfig> get rcUpdateConfigStream;
}
