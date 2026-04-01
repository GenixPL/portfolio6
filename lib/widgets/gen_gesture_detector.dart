import 'package:flutter/material.dart';

/// A widget that detects gestures.
///
/// Will automatically invoke haptic feedback when pressed and handle mouse cursor changes if
/// [onTap] is not null.
///
/// A drop-in replacement for [GestureDetector].
class GenGestureDetector extends StatelessWidget {
  const GenGestureDetector({
    super.key,
    required this.onTap,
    required this.child,
    required this.behavior,
  });

  const GenGestureDetector.base({
    super.key,
    required this.onTap,
    required this.child,
    this.behavior,
  });

  final GestureTapCallback? onTap;
  final HitTestBehavior? behavior;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //! --- IMPORTANT ---
    // GestureDetector takes as much space as possible, but MouseRegion takes
    // as much space as possible _unless_ it has a child, therefore GestureDetector
    // needs to be above MouseRegion.
    return GestureDetector(
      onTap: _getEffectiveOnTap(),
      behavior: behavior,
      child: MouseRegion(
        cursor: _getMouseCursor(),
        child: child,
      ),
    );
  }

  // VALUES

  MouseCursor _getMouseCursor() {
    if (onTap == null) {
      return MouseCursor.defer;
    }

    return SystemMouseCursors.click;
  }

  GestureTapCallback? _getEffectiveOnTap() {
    if (onTap == null) {
      return null;
    }

    return () {
      // HapticFeedback.mediumImpact();
      onTap?.call();
    };
  }
}
