import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';

/// Creates implicit animated widget that calls [builder] whenever [value] changes.
///
/// [T] cannot be nullable if [initialValue] is used.
class AnimatedValueBuilder<T> extends StatefulWidget {
  const AnimatedValueBuilder({
    super.key,
    required this.value,
    required this.builder,
    this.animationDuration,
    this.animationCurve,
    this.child,
    this.initialValue,
    this.comparator,
  });

  /// Value that is checked for changes.
  final T value;

  /// Function called for every frame of animation.
  ///
  /// [from] is the previous value that was set before animation started.
  /// [to] is the value to which it's been changed.
  /// [progress] is the progress of the animation between <0.0, 1.0>.
  final Widget Function(T from, T to, double progress, Widget? child) builder;

  /// Duration of the switch animation.
  final Duration? animationDuration;

  /// Curve of the switch animation.
  final Curve? animationCurve;

  /// Optional parameter that is passed to the [builder] function.
  final Widget? child;

  /// Initial value from which animation will be played initially if [animateInitial] is true.
  final T? initialValue;

  /// Optional parameter that can override default comparison of the current and previous values.
  ///
  /// Should return true if elements are the same.
  final bool Function(T previous, T current)? comparator;

  @override
  State<AnimatedValueBuilder<T>> createState() => _AnimatedValueBuilderState<T>();
}

class _AnimatedValueBuilderState<T> extends State<AnimatedValueBuilder<T>> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.animationDuration ?? context.theme.basicAnimationDuration,
  );
  late final CurvedAnimation _animation = CurvedAnimation(
    curve: widget.animationCurve ?? context.theme.basicAnimationCurve,
    parent: _controller,
  );

  late T _from = widget.value;
  late T _to = widget.value;

  @override
  void initState() {
    final T? initialValue = widget.initialValue;
    if (initialValue != null) {
      _from = initialValue;
      _to = widget.value;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(
          _controller.forward(from: 0.0),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // To be sure that when duration or curve is changed it's changed in the state.
    _controller.duration = widget.animationDuration ?? context.theme.basicAnimationDuration;
    _animation.curve = widget.animationCurve ?? context.theme.basicAnimationCurve;

    // Check if value has been changed.
    _checkValue();

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (BuildContext context, Widget? child) {
          return widget.builder(_from, _to, _animation.value, widget.child);
        },
      ),
    );
  }

  void _checkValue() {
    if (_compare(_to, widget.value)) {
      return;
    }

    _from = _to;
    _to = widget.value;
    unawaited(
      _controller.forward(from: 0.0),
    );
  }

  /// Returns true if parameters are the same.
  bool _compare(T previous, T next) {
    if (widget.comparator != null) {
      return widget.comparator!(previous, next);
    }

    return previous == next;
  }
}
