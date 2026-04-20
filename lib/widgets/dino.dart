import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class Dino extends StatefulWidget {
  const Dino({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<Dino> createState() => _DinoState();
}

class _DinoState extends State<Dino> {
  static bool _imagesCached = false;
  static const String _eyePath = 'assets/images/dino_eye.png';
  static const String _noEyePath = 'assets/images/dino_no_eye.png';
  static const double _defaultWidth = 264;

  static const Duration _long = Duration(milliseconds: 1500);
  static const Duration _short = Duration(milliseconds: 175);

  bool _eye = true;
  int _blinkStep = 0;
  Timer? _blinkTimer;

  @override
  void initState() {
    super.initState();
    _blink();
  }

  @override
  void dispose() {
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GenGestureDetector.base(
        onTap: () {
          if (_imagesCached) {
            widget.onTap();
          }
        },
        child: FutureBuilder(
          future: () async {
            if (_imagesCached) {
              return;
            }

            await Future.wait([
              precacheImage(AssetImage(_eyePath), context),
              precacheImage(AssetImage(_noEyePath), context),
              Future.delayed(Duration(milliseconds: 500)),
            ]);

            _imagesCached = true;
          }.call(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final double sizeFactor = min(constraints.maxWidth, _defaultWidth) / _defaultWidth;

                return Center(
                  child: CustomPaint(
                    painter: _Painter(
                      color: context.theme.primary,
                      showText: _imagesCached,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        52 * sizeFactor,
                      ),
                      child: SizedBox(
                        width: _defaultWidth * sizeFactor,
                        child: AspectRatio(
                          aspectRatio: 44 / 47,
                          child: _imagesCached
                              ? Image.asset(
                                  _eye ? _eyePath : _noEyePath,
                                )
                              : Center(
                                  child: GenProgressIndicator(),
                                ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _blink() {
    _blinkTimer?.cancel();

    // Wait long then close eye.
    if (_blinkStep == 0) {
      _blinkTimer = Timer(_long, () {
        _eye = false;
        setState(() {});
        _blink();
      });
    }

    // Wait short then open eye.
    if (_blinkStep == 1) {
      _blinkTimer = Timer(_short, () {
        _eye = true;
        setState(() {});
        _blink();
      });
    }

    // Wait long then close eye.
    if (_blinkStep == 2) {
      _blinkTimer = Timer(_long, () {
        _eye = false;
        setState(() {});
        _blink();
      });
    }

    // Wait short then open eye.
    if (_blinkStep == 3) {
      _blinkTimer = Timer(_short, () {
        _eye = true;
        setState(() {});
        _blink();
      });
    }

    // Wait short then close eye.
    if (_blinkStep == 4) {
      _blinkTimer = Timer(_short, () {
        _eye = false;
        setState(() {});
        _blink();
      });
    }

    // Wait short then open eye.
    if (_blinkStep == 5) {
      _blinkTimer = Timer(_short, () {
        _eye = true;
        setState(() {});
        _blink();
      });
    }

    _blinkStep += 1;
    _blinkStep %= 6;
  }
}

class _Painter extends CustomPainter {
  _Painter({
    required this.color,
    required this.showText,
  });

  static const double _lineHeightFactor = 0.125;
  static const double _lineWidthFactor = 0.375;
  static const double _strokeWidth = 8;

  final bool showText;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = _strokeWidth
      ..isAntiAlias = false
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.miter
      ..strokeCap = StrokeCap.square;

    final Path path = Path();

    final double halfStrokeWidth = _strokeWidth / 2;

    // Top right line
    path.moveTo(
      size.width * (1 - _lineWidthFactor) - halfStrokeWidth,
      0 + halfStrokeWidth,
    );
    path.lineTo(
      size.width - halfStrokeWidth,
      0 + halfStrokeWidth,
    );
    path.lineTo(
      size.width - halfStrokeWidth,
      size.height * _lineHeightFactor + halfStrokeWidth,
    );

    // Bottom left line
    path.moveTo(
      size.width * _lineWidthFactor + halfStrokeWidth,
      size.height - halfStrokeWidth,
    );
    path.lineTo(
      0 + halfStrokeWidth,
      size.height - halfStrokeWidth,
    );
    path.lineTo(
      0 + halfStrokeWidth,
      size.height * (1 - _lineHeightFactor) - halfStrokeWidth,
    );

    canvas.drawPath(path, paint);

    // "PLAY" text
    if (showText) {
      _painText(canvas, size);
    }
  }

  void _painText(Canvas canvas, Size size) {
    final TextSpan textSpan = TextSpan(
      text: '<TAP TO PLAY>',
      style: TextStyle(
        color: color,
        height: 1.0,
        leadingDistribution: TextLeadingDistribution.even,
        fontSize: _strokeWidth,
        fontFamily: FontFamily.cpMono.assetName,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr, // Required
      textHeightBehavior: TextHeightBehavior(
        applyHeightToLastDescent: false,
        applyHeightToFirstAscent: false,
      ),
    );

    // You must call layout() before painting to calculate the size
    textPainter.layout();

    // Draw the text onto the canvas at a specific Offset
    textPainter.paint(
      canvas,
      Offset(
        size.width - textPainter.width,
        // +1 is a manual correction due to the font
        size.height - textPainter.height + 1,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    if (oldDelegate.color != color) {
      return true;
    }

    if (oldDelegate.showText != showText) {
      return true;
    }

    return false;
  }
}
