import 'package:url_launcher/url_launcher.dart';

URLauncher({required String urlString}) async {
  final Uri urlPaser = Uri.parse(urlString);

  if (await canLaunchUrl(urlPaser)) {
    launchUrl(urlPaser, mode: LaunchMode.externalApplication);
  }
}

String URLhost({required String urlString}) {
  Uri uri = Uri.parse(urlString);

  return uri.host;
}
