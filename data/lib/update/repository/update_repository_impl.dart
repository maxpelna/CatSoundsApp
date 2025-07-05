import 'package:domain/remote_config/model/rc_update_config.dart';
import 'package:domain/update/model/update_config.dart';
import 'package:domain/update/model/update_status.dart';
import 'package:domain/update/repository/update_repository.dart';
import 'package:domain/version/repository/version_repository.dart';
import 'package:version/version.dart';

final class UpdateRepositoryImpl implements UpdateRepository {
  final VersionRepository _versionRepository;

  const UpdateRepositoryImpl({
    required VersionRepository versionRepository,
  }) : _versionRepository = versionRepository;

  @override
  UpdateConfig validateRcUpdateConfig({
    required RcUpdateConfig config,
  }) {
    final currentVersionString = _getCurrentAppVersion();

    final latestVersionString = config.latestAppVersion;
    final latestVersion = _assembleVersion(latestVersionString);
    final currentVersion = _assembleVersion(currentVersionString);
    final updateAvailable = currentVersion < latestVersion;
    final forceUpdate = updateAvailable && config.isForceUpdate;
    final displayVersion = latestVersion.toString();

    var status = UpdateStatus.none;
    if (forceUpdate) {
      status = UpdateStatus.forceUpdate;
    } else if (updateAvailable) {
      status = UpdateStatus.updateAvailable;
    }

    return UpdateConfig(version: displayVersion, status: status);
  }

  String _getCurrentAppVersion() => _versionRepository.currentVersion;

  Version _assembleVersion(String version) {
    final parts = version.split('.');
    final firstPartElement = parts.firstOrNull ?? '1';
    final secondPartElement = parts.elementAtOrNull(1) ?? '0';
    final thirdPartElement = parts.elementAtOrNull(2) ?? '0';

    final major = int.tryParse(parts.isNotEmpty ? firstPartElement : '1') ?? 1;
    final minor = int.tryParse(parts.length > 1 ? secondPartElement : '0') ?? 0;
    final patch = int.tryParse(parts.length > 2 ? thirdPartElement : '0') ?? 0;

    return Version(major, minor, patch);
  }
}
