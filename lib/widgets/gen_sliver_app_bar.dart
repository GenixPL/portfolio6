import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GenSliverAppBar extends StatelessWidget {
  const GenSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (_, SliverConstraints constraints) {
        const double height = kToolbarHeight;

        final Color backgroundColor = Theme.of(context).colorScheme.surface;

        return SliverAppBar(
          pinned: true,
          expandedHeight: height * 1.5,
          collapsedHeight: height,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.lerp(
            backgroundColor,
            Color.lerp(backgroundColor, Colors.black, 0.35),
            (constraints.scrollOffset / (height * 0.5)).clamp(0, 1),
          ),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('a'),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(3),
            child: AnimatedContainer(
              height: 3,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
              color: constraints.scrollOffset > height ? Colors.black.withAlpha(200) : Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
