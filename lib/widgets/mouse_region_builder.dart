import 'package:flutter/cupertino.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class MouseRegionBuilder extends StatefulWidget {
  const MouseRegionBuilder({
    super.key,
    required this.onTap,
    required this.builder,
  });

  final VoidCallback? onTap;
  final Widget Function(BuildContext context, bool hovered) builder;

  @override
  State<MouseRegionBuilder> createState() => _MouseRegionBuilderState();
}

class _MouseRegionBuilderState extends State<MouseRegionBuilder> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: MouseRegion(
        onEnter: (_) {
          if (widget.onTap == null) {
            return;
          }
          _hovered = true;
          setState(() {});
        },
        onExit: (_) {
          if (widget.onTap == null) {
            return;
          }
          _hovered = false;
          setState(() {});
        },
        child: GenGestureDetector.base(
          onTap: widget.onTap,
          child: SelectionContainer.disabled(
            child: widget.builder(context, _hovered),
          ),
        ),
      ),
    );
  }
}
