import 'package:cat_sounds/di/model/di_module.dart';

final class LateModule implements DIModule {
  const LateModule();

  @override
  Future<void> configureDependencies() async {
    // TODO: Late repositories or use cases that requires repositories in chaotic order.
  }
}
