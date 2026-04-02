import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/gen_theme.dart';
import 'package:portfolio6/utils/widget_list_extensions.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class MenuIcon extends StatefulWidget {
  const MenuIcon({
    super.key,
    required this.menuOpen,
    required this.onTap,
    required this.buttons,
  });

  final bool menuOpen;
  final VoidCallback onTap;
  final List<Widget> buttons;

  @override
  State<MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        _hovered = true;
        setState(() {});
      },
      onExit: (_) {
        _hovered = false;
        setState(() {});
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: AnimatedValueBuilder(
            value: switch ((widget.menuOpen, _hovered)) {
              // Hovered when open - slightly extend to indicate closing.
              (true, true) => 0.75,
              // Just open without hovering.
              (true, false) => 1.0,
              // Hover when closed - shorten to indicate opening.
              (false, true) => 0.75,
              // Just closed without hovering.
              (false, false) => 0.0,
            },
            initialValue: 0.0,
            builder: (from, to, progress, _) {
              final double animationValue = lerpDouble(from, to, progress)!;

              final Color? color = Color.lerp(
                context.theme.primary,
                context.theme.secondary,
                animationValue,
              );

              const double width = 22;

              return SizedBox(
                width: width,
                height: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLine(
                      width: width * 1.0,
                      color: color,
                      animationValue: animationValue,
                    ),
                    _buildLine(
                      width: width * lerpDouble(1.0, 0.75, animationValue)!,
                      color: color,
                      animationValue: animationValue,
                    ),
                    _buildLine(
                      width: width * lerpDouble(1.0, 0.5, animationValue)!,
                      color: color,
                      animationValue: animationValue,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLine({
    required double width,
    required Color? color,
    required double animationValue,
  }) {
    return Container(
      height: 2,
      width: width,
      decoration: ShapeDecoration(
        color: color,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(2 * animationValue),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    widget.onTap();
    return;

    showDialog(
      context: context,
      barrierColor: Colors.black87,
      useSafeArea: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),

              Column(
                children: widget.buttons.withGaps(
                  12,
                  sliver: false,
                ),
              ),

              const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
