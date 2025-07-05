import 'package:domain/version/repository/version_repository.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class VersionRepositoryImpl implements VersionRepository {
  final PackageInfo packageInfo;

  const VersionRepositoryImpl({
    required this.packageInfo,
  });

  @override
  String get currentVersion => packageInfo.version;
}
