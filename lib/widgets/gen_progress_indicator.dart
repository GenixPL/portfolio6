import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';

class GenProgressIndicator extends StatefulWidget {
  const GenProgressIndicator({
    super.key,
    this.size,
    this.color,
  });

  final double? size;
  final Color? color;

  @override
  State<GenProgressIndicator> createState() => _GenProgressIndicatorState();
}

class _GenProgressIndicatorState extends State<GenProgressIndicator> with TickerProviderStateMixin {
  late final AnimationController _valueController = AnimationController(
    vsync: this,
    upperBound: 2.0,
  );
  late final AnimationController _widthController = AnimationController(
    vsync: this,
    lowerBound: 0.1,
    upperBound: 0.75,
  );

  @override
  void initState() {
    super.initState();
    _valueController.addListener(() {
      if (_valueController.isCompleted) {
        _animate();
      }

      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animate();
    });
  }

  void _animate() {
    _valueController.value = _valueController.value % 1;
    final double value = _valueController.value + ((Random().nextInt(35) + 25) / 100);
    unawaited(
      _valueController.animateTo(
        value,
        duration: const Duration(milliseconds: 750),
        curve: Curves.ease,
      ),
    );

    final double width = ((Random().nextInt(65) + 10) / 100);
    if (width > _widthController.value) {
      unawaited(
        _widthController.animateBack(
          width,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        ),
      );
    } else {
      unawaited(
        _widthController.animateTo(
          width,
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
        ),
      );
    }
  }

  @override
  void dispose() {
    _valueController.dispose();
    _widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox.square(
          dimension: widget.size ?? 75,
          child: CustomPaint(
            painter: _Painter(
              color: widget.color ?? context.theme.secondary,
              valueFactor: _valueController.value % 1,
              widthFactor: _widthController.value,
            ),
          ),
        );
      },
    );
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.color,
    required this.valueFactor,
    required this.widthFactor,
  });

  final Color color;
  final double valueFactor;
  final double widthFactor;

  @override
  void paint(Canvas canvas, Size size) {
    final double minSize = min(size.width, size.height);

    final paint = Paint()
      ..color = color
      ..strokeWidth = minSize / 25
      ..isAntiAlias = false
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.square;

    final double remainingWidth = size.width - minSize;
    final double remainingHeight = size.height - minSize;

    final Offset leftTop = Offset(
      remainingWidth / 2,
      remainingHeight / 2,
    );
    final Offset rightTop = Offset(
      size.width - (remainingWidth / 2),
      remainingHeight / 2,
    );
    final Offset rightBottom = Offset(
      size.width - (remainingWidth / 2),
      size.height - (remainingHeight / 2),
    );
    final Offset leftBottom = Offset(
      remainingWidth / 2,
      size.height - (remainingHeight / 2),
    );

    final path = Path();
    // Start at top-left
    path.moveTo(leftTop.dx, leftTop.dy);
    // Define the full square path clockwise
    path.lineTo(rightTop.dx, rightTop.dy); // Top (0 to 1)
    path.lineTo(rightBottom.dx, rightBottom.dy); // Right (1 to 2)
    path.lineTo(leftBottom.dx, leftBottom.dy); // Bottom (2 to 3)
    path.lineTo(leftTop.dx, leftTop.dy); // Left (3 to 4)

    final double sanitizedValue = valueFactor.clamp(0, 1);
    final double adjustedValue = sanitizedValue * 4;
    final double sanitizedWidth = widthFactor.clamp(0, 1);
    final double minValue = adjustedValue - sanitizedWidth;
    final double maxValue = adjustedValue + sanitizedWidth;

    // Use path metrics to extract the specific segment
    PathMetrics metrics = path.computeMetrics();
    for (PathMetric metric in metrics) {
      Path extract = metric.extractPath(
        metric.length * (minValue / 4),
        metric.length * (maxValue / 4),
      );
      canvas.drawPath(extract, paint);

      if (minValue < 0) {
        Path extract = metric.extractPath(
          metric.length * ((4 + minValue) / 4),
          metric.length,
        );
        canvas.drawPath(extract, paint);
      }

      if (maxValue > 4) {
        Path extract = metric.extractPath(
          0,
          metric.length * ((maxValue - 4) / 4),
        );
        canvas.drawPath(extract, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    if (oldDelegate.color != color) {
      return true;
    }

    if (oldDelegate.valueFactor != valueFactor) {
      return true;
    }

    if (oldDelegate.widthFactor != widthFactor) {
      return true;
    }

    return false;
  }
}
