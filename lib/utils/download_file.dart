import 'package:url_launcher/url_launcher_string.dart';

Future<void> downloadFile({
  required String assetPath,
}) async {
  launchUrlString(
    'https://raw.githubusercontent.com/GenixPL/portfolio6/main/$assetPath',
  );
}
