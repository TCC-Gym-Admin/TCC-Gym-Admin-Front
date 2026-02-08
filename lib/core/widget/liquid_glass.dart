import 'dart:ui';

import 'package:flutter/material.dart';

Widget liquidGlass({
  required Widget child,
  double blur = 15,
  int opacity = 35,
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(20)),
}) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(opacity),
          borderRadius: borderRadius,
          border: Border.all(color: Colors.white.withAlpha(25)),
        ),
        child: child,
      ),
    ),
  );
}
