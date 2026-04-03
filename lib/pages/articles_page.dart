import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  static bool _wereCached = false;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [
        FutureBuilder<void>(
          future: () async {
            if (_wereCached) {
              return;
            }

            final List<Future> futures = [
              Future.delayed(Duration(milliseconds: 1000)),
            ];

            for (MediumFeedItem item in mediumFeedItems) {
              final String? url = item.mediaUrl;
              if (url != null) {
                futures.add(
                  precacheImage(NetworkImage(url), context),
                );
              }
            }

            await Future.wait(futures);
            _wereCached = true;
          }.call(),
          builder: (_, snapshot) {
            // The _wereCached check was added here because the widget is sometimes
            // rebuilt and jumps between `waiting` and `done`, which causes flickers.
            if (snapshot.connectionState == ConnectionState.waiting && !_wereCached) {
              return GenProgressIndicator().sliver;
            }

            return SliverMainAxisGroup(
              slivers: [
                for (MediumFeedItem item in mediumFeedItems)
                  ArticleCard(
                    item: item,
                  ).sliver,
              ].withGaps(24),
            );
          },
        ),
      ].withPadding(context.theme.minPageVerticalPadding).withHorizontalPadding(context.theme.minPageHorizontalPadding),
    );
  }
}
