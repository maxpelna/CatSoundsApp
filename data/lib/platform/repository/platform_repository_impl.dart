import 'dart:io';

import 'package:domain/platform/repository/platform_repository.dart';

final class PlatformRepositoryImpl implements PlatformRepository {
  const PlatformRepositoryImpl();

  @override
  bool get isIos => Platform.isIOS;
}
