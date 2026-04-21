import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({
    super.key,
    required this.controller,
    required this.axis,
    required this.child,
    this.width = 4,
  });

  final ScrollController controller;
  final Axis axis;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        if (controller.hasClients) _buildLeft(context),

        if (controller.hasClients) _buildRight(context),
      ],
    );
  }

  Widget _buildLeft(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: context.theme.basicAnimationDuration,
        curve: context.theme.basicAnimationCurve,
        width: width,
        decoration: ShapeDecoration(
          color: controller.offset > 0 ? Colors.black.withAlpha(200) : Colors.transparent,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRight(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: context.theme.basicAnimationDuration,
        curve: context.theme.basicAnimationCurve,
        width: width,
        decoration: ShapeDecoration(
          color: controller.offset < controller.position.maxScrollExtent
              ? Colors.black.withAlpha(200)
              : Colors.transparent,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
