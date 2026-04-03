import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GenScrollBehavior extends MaterialScrollBehavior {
  const GenScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
