// ignore_for_file: no-equal-arguments, no-empty-block

import 'package:domain/locale/model/app_language.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:presentation/feature/home/design_system/widget/design_system_page.dart';

import '../devices.dart';
import '../test_app_wrapper.dart';

void main() {
  testGoldens(
    'Design system page page',
    (tester) async {
      final page = DesignSystemPage();

      // Light mode en.
      await tester.pumpWidgetBuilder(
        page,
        wrapper: testMaterialWrapper(
          textScaleFactor: 1.0,
          isDarkMode: false,
          appLanguage: AppLanguage.en,
        ),
      );

      await multiScreenGolden(
        tester,
        'about_us_page_light_en',
        devices: devicesWithNormalTextScaleFactor,
      );

      // Light mode lv.
      await tester.pumpWidgetBuilder(
        page,
        wrapper: testMaterialWrapper(
          textScaleFactor: 1.0,
          isDarkMode: false,
          appLanguage: AppLanguage.lv,
        ),
      );

      await multiScreenGolden(
        tester,
        'about_us_page_light_lv',
        devices: devicesWithNormalTextScaleFactor,
      );

      // Dark mode.
      await tester.pumpWidgetBuilder(
        page,
        wrapper: testMaterialWrapper(
          textScaleFactor: 1.0,
          isDarkMode: true,
          appLanguage: AppLanguage.en,
        ),
      );

      await multiScreenGolden(
        tester,
        'about_us_page_dark',
        devices: devicesWithNormalTextScaleFactor,
      );

      // Font scale.
      await tester.pumpWidgetBuilder(
        page,
        wrapper: testMaterialWrapper(
          textScaleFactor: 1.6,
          isDarkMode: false,
          appLanguage: AppLanguage.en,
        ),
      );

      await multiScreenGolden(
        tester,
        'about_us_page_scale',
        devices: devicesWithLargeTextScaleFactor,
      );
    },
  );
}
