import 'package:flutter/foundation.dart';

/// Shared bottom-tab index so pushed routes can switch tabs after pop.
final ValueNotifier<int> appTabIndex = ValueNotifier<int>(0);
