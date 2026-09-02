import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchAppUri(BuildContext context, String url) async {
  final uri = Uri.parse(url);
  final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
  if (!ok && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تعذر فتح الرابط')),
    );
  }
}

Future<void> launchPhone(BuildContext context, String phone) async {
  await launchAppUri(context, 'tel:$phone');
}

Future<void> launchEmail(BuildContext context, String email) async {
  await launchAppUri(context, 'mailto:$email');
}

Future<void> copyText(
  BuildContext context,
  String text, {
  required String successMessage,
}) async {
  await Clipboard.setData(ClipboardData(text: text));
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(successMessage)),
    );
  }
}
