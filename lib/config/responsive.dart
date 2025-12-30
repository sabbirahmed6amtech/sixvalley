import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static const double desktopMinWidth = 800;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < desktopMinWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopMinWidth;
}
