import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
    required this.onTap,
    required this.external,
    this.text = 'read more',
  });

  final String text;
  final VoidCallback onTap;
  final bool external;

  @override
  Widget build(BuildContext context) {
    return MouseRegionBuilder(
      onTap: onTap,
      builder: (context, bool hovered) {
        return AnimatedValueBuilder<double>(
          value: hovered ? 1 : 0,
          builder: (from, to, double progress, Widget? child) {
            final Color color = Color.lerp(
              context.theme.primary,
              context.theme.secondary,
              lerpDouble(from, to, progress)!,
            )!;

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    // Space at the end add "padding" to the icon.
                    text.toUpperCase(),
                    style: TextStyle(
                      fontFamily: FontFamily.cpMono.assetName,
                      color: color,
                    ),
                    textHeightBehavior: const TextHeightBehavior(
                      applyHeightToLastDescent: false,
                      applyHeightToFirstAscent: false,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    external ? Icons.open_in_new_sharp : Icons.chevron_right_sharp,
                    color: color,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
