import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/pages/home/home_page_card.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [
        Row(
          children: [
            Flexible(
              child: Dino(
                onTap: () {
                  context.goNamed('dino');
                },
              ),
            ),
          ],
        ).sliver,

        _Section().sliver,
      ].withGaps(context.theme.defaultSpacing(context)),
    );
  }
}

class _Section extends StatefulWidget {
  const _Section();

  @override
  State<_Section> createState() => _SectionState();
}

class _SectionState extends State<_Section> {
  late final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<MediumFeedItem> items = mediumFeedItems.sublist(0, 5);

    const double horizontalPadding = 12;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: horizontalPadding),
                  Text(
                    'latest articles'.toUpperCase(),
                    style: context.theme.textTheme.headlineSmall,
                  ),
                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: horizontalPadding),
                  ReadMore(
                    text: 'see all',
                    onTap: () => context.goNamed('articles'),
                    external: false,
                  ),
                  SizedBox(width: horizontalPadding),
                ],
              ),
            ],
          ),
          Gap(12),
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 400,
              maxHeight: 400,
              maxWidth: 600,
            ),
            child: ScrollWrapper(
              axis: Axis.horizontal,
              controller: _pageController,
              child: PageView(
                controller: _pageController,
                children: [
                  for (MediumFeedItem item in items)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                      ),
                      child: HomePageCard(
                        title: item.title,
                        subtitle: item.description,
                        image: Image.network(
                          item.mediaUrl,
                          fit: BoxFit.cover,
                        ),
                        tags: item.tags,
                        date: item.publicationDate,
                        url: item.url,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              for (int i = 0; i < items.length; i++) _buildPageIndicator(i),
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
