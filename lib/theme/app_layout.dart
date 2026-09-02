import 'package:flutter/material.dart';

class AppLayout {
  static const double compact = 600;
  static const double medium = 840;

  static Size sizeOf(BuildContext context) => MediaQuery.sizeOf(context);

  static bool isCompact(double width) => width < compact;

  static int serviceColumns(double width) {
    if (width >= 1100) return 4;
    if (width >= 700) return 3;
    return 2;
  }

  static int statColumns(double width) => width < 420 ? 2 : 4;

  static double pagePadding(double width) {
    if (width >= medium) return 32;
    if (width >= compact) return 24;
    return width < 360 ? 12 : 16;
  }

  static double contentMaxWidth(double width) {
    if (width >= 1100) return 1040;
    if (width >= medium) return 800;
    return width;
  }

  static double heroHeight(Size size) {
    if (size.width < 360 || size.height < 640) return 188;
    if (size.width >= 700) return (size.height * 0.32).clamp(240.0, 320.0);
    return (size.height * 0.26).clamp(200.0, 248.0);
  }

  static double campaignWidth(double width) {
    if (width >= 700) return 320;
    return (width * 0.78).clamp(220.0, 280.0);
  }

  static double campaignHeight(double width) {
    if (width < 360) return 156;
    return 176;
  }

  static double serviceAspectRatio(double availableWidth, int columns) {
    final spacing = 12.0 * (columns - 1);
    final cardWidth = ((availableWidth - spacing) / columns).clamp(120.0, 420.0);
    final footerHeight = availableWidth < 360 ? 86.0 : 94.0;
    final imageHeight = cardWidth * 0.56;
    return cardWidth / (imageHeight + footerHeight);
  }
}

class ResponsiveBody extends StatelessWidget {
  final Widget child;
  final bool padded;

  const ResponsiveBody({super.key, required this.child, this.padded = false});

  @override
  Widget build(BuildContext context) {
    final width = AppLayout.sizeOf(context).width;
    final maxWidth = AppLayout.contentMaxWidth(width);
    final padding = padded ? AppLayout.pagePadding(width) : 0.0;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: padded
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: child,
              )
            : child,
      ),
    );
  }
}
