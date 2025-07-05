import 'package:cat_sounds/bootstrap.dart';
import 'package:cat_sounds/di/manager/di_manager.dart';
import 'package:cat_sounds/env/env_config.dart';
import 'package:presentation/app/widget/app.dart';

void main() async {
  await bootstrap(
    () async {
      await configureDependencies();

      return App.withBloc(
        enableDebugView: EnvConfig.enableDebugView,
      );
    },
  );
}
