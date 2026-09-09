import 'package:flutter/material.dart';
import 'auth_guards.dart';

VoidCallback serviceDonateAction(BuildContext context) {
  return () => goToDonate(context);
}
