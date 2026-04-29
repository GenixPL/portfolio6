import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GenScrollBehavior extends MaterialScrollBehavior {
  const GenScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.trackpad,
    // We don't want desktop web to scroll with mouse
    // click because it disrupts text selection.
    // PointerDeviceKind.mouse,
  };
}
