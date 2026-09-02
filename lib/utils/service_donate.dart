import 'package:flutter/material.dart';
import '../navigation/app_tabs.dart';

VoidCallback serviceDonateAction(BuildContext context) {
  return () {
    Navigator.of(context).popUntil((route) => route.isFirst);
    appTabIndex.value = 1;
  };
}
