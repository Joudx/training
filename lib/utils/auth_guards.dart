import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../data/auth_session.dart';
import '../l10n/app_localizations.dart';
import '../navigation/app_tabs.dart';
import '../screens/auth/login_screen.dart';

bool isLoggedIn() => AuthSession.instance.isLoggedIn;

void goToDonate(BuildContext context) {
  if (!AuthSession.instance.isLoggedIn) {
    final l10n = AppLocalizations.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n?.loginRequired ?? '')),
    );
    return;
  }
  Navigator.of(context).popUntil((route) => route.isFirst);
  appTabIndex.value = 1;
}

void openDonationHistory(BuildContext context) {
  if (!AuthSession.instance.isLoggedIn) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (_) => false,
    );
    return;
  }
  Navigator.pushNamed(context, AppRoutes.donationHistory);
}
