import 'package:fimber/fimber.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

mixin UrlLauncher {
  void openWeb({
    required String url,
    bool externalApp = false,
  }) async {
    try {
      final uri = Uri.tryParse(url);
      if (uri == null) throw Exception('Failed to parse url: $url');

      final mode = externalApp
          ? LaunchMode.externalApplication
          : LaunchMode.platformDefault;

      await launchUrl(uri, mode: mode);
    } on Exception catch (ex, st) {
      Fimber.w('Failed to open url: $url', ex: ex, stacktrace: st);
      await _showErrorMessage();
    }
  }

  Future<void> _showErrorMessage() async {
    await Fluttertoast.showToast(
      msg: 'Something went wrong.',
    );
  }
}
