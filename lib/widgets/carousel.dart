import 'package:flutter/material.dart';
import 'package:portfolio6/theme/gen_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
    required this.aspectRatio,
    required this.maxHeight,
    required this.children,
  });

  final double? aspectRatio;
  final double maxHeight;
  final List<Widget> children;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() => setState(() {}));

    // Makes sure the widget is rendered at least once with
    // clients attached to the controller.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget scrollWrapper = ScrollWrapper(
      axis: Axis.horizontal,
      controller: _pageController,
      child: PageView(
        controller: _pageController,
        children: widget.children,
      ),
    );

    final double? aspectRatio = widget.aspectRatio;

    return RepaintBoundary(
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widget.maxHeight,
            ),
            child: aspectRatio == null
                ? scrollWrapper
                : AspectRatio(
                    aspectRatio: aspectRatio,
                    child: scrollWrapper,
                  ),
          ),

          Gap(8),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            children: [
              for (int i = 0; i < widget.children.length; i++) _buildPageIndicator(i),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(int i) {
    final int? currentPage = (_pageController.hasClients ? _pageController.page?.round() : 0);
    final bool isCurrent = (i == currentPage);
    final double size = isCurrent ? 16 : 10;
    final Duration duration = context.theme.basicAnimationDuration;
    final Curve curve = context.theme.basicAnimationCurve;

    return GenGestureDetector.base(
      onTap: () {
        _pageController.animateToPage(
          i,
          duration: duration,
          curve: curve,
        );
      },
      child: SizedBox(
        width: 16,
        height: 16,
        child: Center(
          child: AnimatedContainer(
            duration: duration,
            curve: curve,
            height: size,
            width: size,
            color: isCurrent ? context.theme.secondary : context.theme.primary,
          ),
        ),
      ),
    );
  }
}
