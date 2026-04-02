import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class GenSliverAppBar extends StatelessWidget {
  const GenSliverAppBar({
    super.key,
    required this.menuOpen,
    required this.onMenuTap,
  });

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
    final TextScaler textScaler = TextScaler.linear(scale);

    const double bottomLineHeight = 3;

    final double spacing = 12 * scale;

    final List<Widget> buttons = _buildMenuButtons(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: bottomLineHeight),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: spacing,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  '|_|0|_|\n|_|_|0|\n|0|0|0|',
                  textScaler: textScaler,
                  style: TextStyle(
                    fontFamily: FontFamily.cpMono.assetName,
                    fontSize: 8.0,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              // TODO(genix): center this
              Text(
                // Letter sizes are strange due to the font.
                'łN',
                textScaler: textScaler,
                style: TextStyle(
                  fontFamily: FontFamily.kontanter.assetName,
                  fontSize: 20.0,
                ),
              ),

              const Spacer(),

              if (MediaQuery.sizeOf(context).width >= 450)
                ...buttons.withGaps(
                  spacing,
                  sliver: false,
                )
              else
                MenuIcon(
                  menuOpen: menuOpen,
                  onTap: onMenuTap,
                  buttons: buttons,
                ),
            ],
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

  List<Widget> _buildMenuButtons(BuildContext context) {
    return [
      _buildMenuButton(
        context: context,
        name: 'home',
        routeName: 'home',
      ),
      _buildMenuButton(
        context: context,
        name: 'articles',
        routeName: 'articles',
      ),
    ];
  }

  Widget _buildMenuButton({
    required BuildContext context,
    required String name,
    required String routeName,
  }) {
    final String? activePageName = GoRouterState.of(context).topRoute?.name;

    return TextButton(
      onPressed: () {
        context.goNamed(routeName);
      },
      child: Text(
        name.toUpperCase(),
        style: TextStyle(
          fontFamily: FontFamily.cpMono.assetName,
          color: activePageName == routeName ? Theme.of(context).colorScheme.secondary : null,
        ),
      ),
    );
  }
}
