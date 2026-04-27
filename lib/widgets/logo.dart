import 'package:flutter/material.dart';
import 'package:portfolio6/theme/gen_theme.dart';
import 'package:portfolio6/widgets/mouse_region_builder.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const double size = 40;

    return MouseRegionBuilder(
      builder: (BuildContext context, bool hovered) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: SizedBox.square(
                dimension: size,
                child: child,
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: hovered ? Colors.black.withAlpha(200) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                duration: context.theme.basicAnimationDuration,
                curve: context.theme.basicAnimationCurve,
              ),
            ),
          ],
        );
      },
      onTap: onTap,
    );
  }
}
