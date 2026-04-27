import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

// TODO(genix): add hackathons page
class GenSliverAppBar extends StatelessWidget {
  const GenSliverAppBar({
    super.key,
    required this.containerKey,
    required this.menuOpen,
    required this.onMenuTap,
  });

  static const double _shortAppBarWidth = 720;

  final GlobalKey containerKey;
  final bool menuOpen;
  final VoidCallback onMenuTap;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (_, SliverConstraints constraints) {
        const double height = kToolbarHeight;

        final Color backgroundColor = Theme.of(context).colorScheme.surface;

        final double scale = max(height, height * 1.5 - constraints.scrollOffset) / height;

        return PinnedHeaderSliver(
          child: Container(
            key: containerKey,
            height: height * scale,
            color: Color.lerp(
              backgroundColor,
              Color.lerp(backgroundColor, Colors.black, 0.35),
              (constraints.scrollOffset / (height * 0.5)).clamp(0, 1),
            ),
            child: _buildBody(
              context: context,
              scale: scale,
              scrollOffset: constraints.scrollOffset,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBody({
    required BuildContext context,
    required double scale,
    required double scrollOffset,
  }) {
    const double bottomLineHeight = 3;

    final double spacing = 12 * scale;

    return Column(
      children: [
        const SizedBox(height: bottomLineHeight),

        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildLeftSide(
                  context: context,
                  scale: scale,
                ),

                const Spacer(),

                if (MediaQuery.sizeOf(context).width >= _shortAppBarWidth)
                  ...MenuButton.buildButtons(
                    onTap: () {},
                  ).withGaps(
                    spacing,
                    sliver: false,
                  )
                else
                  MenuIcon(
                    menuOpen: menuOpen,
                    onTap: onMenuTap,
                  ),
              ],
            ),
          ),
        ),

        AnimatedContainer(
          height: bottomLineHeight,
          duration: context.theme.basicAnimationDuration,
          curve: Curves.ease,
          color: scrollOffset > 0 ? Colors.black.withAlpha(200) : Colors.transparent,
        ),
      ],
    );
  }

  Widget _buildLeftSide({
    required BuildContext context,
    required double scale,
  }) {
    return MouseRegionBuilder(
      onTap: menuOpen ? null : () => context.goNamed('home'),
      builder: (_, hovered) {
        return AnimatedValueBuilder<double>(
          value: hovered ? 1 : 0,

          builder: (double from, double to, double progress, Widget? child) {
            final Color color = Color.lerp(
              context.theme.primary,
              context.theme.secondary,
              lerpDouble(from, to, progress)!,
            )!;
            final ColorFilter colorFilter = ColorFilter.mode(
              color,
              BlendMode.srcIn,
            );

            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8 * scale,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/glider_emblem.svg',
                    colorFilter: colorFilter,
                  ),
                ),

                const SizedBox(width: 12.0),

                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 16 * scale,
                  ),
                  child: SvgPicture.asset(
                    'assets/images/website_logo.svg',
                    colorFilter: colorFilter,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
