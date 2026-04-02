import 'package:flutter/foundation.dart';

final bool isMobile = _isMobile;

bool get _isMobile {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
      return true;

    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
      return false;
  }
}
