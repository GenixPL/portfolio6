import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';

class ScrollWrapper extends StatefulWidget {
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
  State<ScrollWrapper> createState() => _ScrollWrapperState();
}

class _ScrollWrapperState extends State<ScrollWrapper> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_update);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_update);
    super.dispose();
  }

  void _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,

        if (widget.controller.hasClients)
          Positioned(
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: context.theme.basicAnimationDuration,
              curve: context.theme.basicAnimationCurve,
              width: widget.width,
              decoration: ShapeDecoration(
                color: widget.controller.offset > 0 ? Colors.black.withAlpha(200) : Colors.transparent,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ),
            ),
          ),

        if (widget.controller.hasClients)
          Positioned(
            top: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: context.theme.basicAnimationDuration,
              curve: context.theme.basicAnimationCurve,
              width: widget.width,
              decoration: ShapeDecoration(
                color: widget.controller.offset < widget.controller.position.maxScrollExtent
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
          ),
      ],
    );
  }
}
