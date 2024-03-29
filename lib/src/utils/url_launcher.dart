import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  const UrlLauncher._();

  // Attempt to open the link inside the app.
  static Future<void> openInternally(String url) async {
    final Uri uri = _removeSpaces(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $uri';
    }
  }

  // Attempt to open the link outside of the app.
  static Future<void> openExternally(String url) async {
    final Uri uri = _removeSpaces(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $uri';
    }
  }

  static Future<void> call(String phoneNumber) async {
    try {
      final Uri callUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(callUri);
    } catch (e) {
      throw 'Could not call $phoneNumber';
    }
  }

  static Uri _removeSpaces(String url) {
    var cleanedUrl = url.replaceAll(RegExp('\\s+'), '');
    return Uri.parse(cleanedUrl);
  }
}
