import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:portfolio6/utils/_utils.dart';

class GenSliverAppBar extends StatelessWidget {
  const GenSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (_, SliverConstraints constraints) {
        const double height = kToolbarHeight;

        return SliverAppBar(
          pinned: true,
          expandedHeight: height * 1.5,
          collapsedHeight: height,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.lerp(
            Colors.transparent,
            Colors.black.withAlpha(100),
            (constraints.scrollOffset / (height * 0.5)).clamp(0, 1),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('a'),
          ),
        );
      },
    );
  }
}
