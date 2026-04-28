import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  static bool _wereCached = false;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      pageId: 'articles',
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
              futures.add(
                precacheImage(NetworkImage(item.mediaUrl), context),
              );
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
                    onTap: () => launchUrlString(item.url),
                    image: Image.network(
                      item.mediaUrl,
                      fit: BoxFit.cover,
                    ),
                    title: item.title,
                    description: item.description,
                    dateText: item.publicationDate.articleFormat,
                    tags: item.tags,
                    external: true,
                  ).sliver,
              ].withGaps(context.theme.cardSpacing),
            );
          },
        ),
      ],
    );
  }
}
