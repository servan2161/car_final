import 'package:flutter/material.dart';

enum screen { mobile, tablet, desktop }

detectscreen(
  Size size,
) {
  if (size.width < 600) {
    return screen.mobile;
  } else if (size.width < 840) {
    return screen.tablet;
  } else {
    return screen.desktop;
  }
}
