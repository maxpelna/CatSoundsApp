import 'package:domain/error/model/general_error.dart';
import 'package:presentation/generated/l10n/app_localizations.g.dart';

final class ErrorMapper {
  static String toMessage(
    AppLocalizations localization, {
    Exception? error,
  }) {
    if (error is GeneralError) {
      return 'General error';
    }

    // TODO: Remove where there is more than 1 error mapping.
    // ignore: prefer-returning-conditional-expressions
    return localization.placeholder;
  }
}
