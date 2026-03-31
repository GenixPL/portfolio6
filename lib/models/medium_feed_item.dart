import 'package:portfolio6/utils/_utils.dart';
import 'package:rss_dart/dart_rss.dart';

class MediumFeedItem {
  const MediumFeedItem({
    required this.title,
    required this.publicationDate,
    required this.mediaUrl,
    required this.url,
    required this.tags,
  });

  static List<MediumFeedItem> listFromFeed(RssFeed feed) {
    final List<MediumFeedItem> items = [];
    for (RssItem item in feed.items) {
      items.add(
        MediumFeedItem(
          title: item.title,
          publicationDate: DateTime.tryParse(item.pubDate ?? ''),
          mediaUrl: item.content?.images.tryFirst,
          url: item.link,
          tags: item.categories.mapList<String?>((e) => e.value).whereType<String>().toList(),
        ),
      );
    }

    return items;
  }

  final String? title;
  final DateTime? publicationDate;
  final String? mediaUrl;
  final String? url;
  final List<String> tags;
}
