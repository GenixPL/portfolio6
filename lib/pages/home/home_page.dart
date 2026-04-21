import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/pages/home/home_page_card.dart';
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
        ),

        _Section(),
      ].slivers.withGapsAndPadding(32).withHorizontalPadding(32),
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ScrollWrapper(
        axis: Axis.horizontal,
        controller: _pageController,
        child: PageView(
          controller: _pageController,
          children: [
            for (MediumFeedItem item in mediumFeedItems.sublist(0, 3))
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
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
    );
  }
}
