import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

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
                _MenuIcon(
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

class _MenuIcon extends StatefulWidget {
  const _MenuIcon({
    required this.buttons,
  });

  final List<Widget> buttons;

  @override
  State<_MenuIcon> createState() => _MenuIconState();
}

class _MenuIconState extends State<_MenuIcon> {
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
            value: _hovered ? 1.0 : 0.0,
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
                    ),
                    _buildLine(
                      width: width * lerpDouble(1.0, 0.75, animationValue)!,
                      color: color,
                    ),
                    _buildLine(
                      width: width * lerpDouble(1.0, 0.5, animationValue)!,
                      color: color,
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
  }) {
    return Container(
      height: 2,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  void _onTap() {
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
