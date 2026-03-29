import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';

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

    final String? activePageName = GoRouterState.of(context).topRoute?.name;

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

              TextButton(
                onPressed: () {
                  context.goNamed('home');
                },
                child: Text(
                  'HOME',
                  style: TextStyle(
                    fontFamily: FontFamily.cpMono.assetName,
                    color: activePageName == 'home' ? Theme.of(context).colorScheme.secondary : null,
                  ),
                ),
              ),
              Gap(spacing),
              TextButton(
                onPressed: () {
                  context.goNamed('articles');
                },
                child: Text(
                  'ARTICLES',
                  style: TextStyle(
                    fontFamily: FontFamily.cpMono.assetName,
                    color: activePageName == 'articles' ? Theme.of(context).colorScheme.secondary : null,
                  ),
                ),
              ),
            ],
          ),
        ),

        AnimatedContainer(
          height: bottomLineHeight,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
          color: scrollOffset > 0 ? Colors.black.withAlpha(200) : Colors.transparent,
        ),
      ],
    );
  }
}
