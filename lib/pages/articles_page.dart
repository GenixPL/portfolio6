import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(),

          ...[
                for (MediumFeedItem item in mediumFeedItems)
                  ArticleCard(
                    item: item,
                  ).sliver,
              ]
              .withGaps(24)
              .withPadding(context.theme.minPageVerticalPadding)
              .withHorizontalPadding(context.theme.minPageHorizontalPadding),
        ].withSafeArea(),
      ),
    );
  }
}
