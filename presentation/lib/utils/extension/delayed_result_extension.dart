import 'package:delayed_result/delayed_result.dart';
import 'package:flutter/material.dart';
import 'package:presentation/error/mapper/error_mapper.dart';
import 'package:presentation/utils/extension/build_context_extension.dart';

extension DelayedResultExtension on DelayedResult {
  String? errorMessage(BuildContext context) => isError
      ? ErrorMapper.toMessage(
          context.localization,
          error: error,
        )
      : null;
}
