import 'package:flutter/material.dart';

import '../data/auth_session.dart';
import '../screens/auth/login_screen.dart';

class RequiresAuth extends StatelessWidget {
  final Widget child;

  const RequiresAuth({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AuthSession.instance,
      builder: (context, _) {
        if (!AuthSession.instance.isLoggedIn) {
          return const LoginScreen();
        }
        return child;
      },
    );
  }
}
