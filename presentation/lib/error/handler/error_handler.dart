import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:presentation/design/src/constants/design_system_constants.dart';
import 'package:presentation/error/widget/error_flash.dart';

mixin ErrorHandler {
  void showErrorMessage(
    BuildContext context, {
    required String error,
  }) =>
      context.showFlash(
        transitionDuration: duration200Milliseconds,
        barrierColor: Colors.transparent,
        duration: duration5Seconds,
        builder: (_, controller) => ErrorFlash(
          controller: controller,
          message: error,
        ),
      );
}
