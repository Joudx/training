import 'package:flutter/material.dart';

import '../data/auth_session.dart';
import '../screens/auth/login_screen.dart';
import '../screens/main_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    AuthSession.instance.restore();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AuthSession.instance,
      builder: (context, _) {
        if (!AuthSession.instance.isReady) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (!AuthSession.instance.isLoggedIn) {
          return const LoginScreen();
        }
        return const MainScreen();
      },
    );
  }
}
