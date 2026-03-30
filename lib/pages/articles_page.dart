import 'package:flutter/material.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:rss_dart/dart_rss.dart';
import 'package:http/http.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<_MediumFeedItem>? _mediumItems;

  @override
  void initState() {
    super.initState();
    // _init();
  }

  Future<void> _init() async {
    final Response fetch;
    try {
      fetch = await get(Uri.parse('https://proxy.corsfix.com/?https://medium.com/feed/@GenixPL'));
    } catch (e) {
      print(e);
      return;
    }

    final rss = RssFeed.parse(fetch.body);
    _mediumItems = _MediumFeedItem.listFromFeed(rss);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<_MediumFeedItem>? mediumItems = _mediumItems;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(),

          if (mediumItems == null)
            CircularProgressIndicator().sliver
          else
            ...[
              for (_MediumFeedItem item in mediumItems)
                Column(
                  children: [
                    Text(item.title ?? 'no title'),
                    Text(item.publicationDate?.toIso8601String() ?? 'no pub date'),
                    Text(item.tags.toString()),
                    Text(item.url ?? 'bo url'),
                    // Text( ?? 'no media url'),
                    Image.network(item.mediaUrl ?? ''),
                  ],
                ).sliver,
            ].withGaps(12),
        ],
      ),
    );
  }
}

class _MediumFeedItem {
  const _MediumFeedItem({
    required this.title,
    required this.publicationDate,
    required this.mediaUrl,
    required this.url,
    required this.tags,
  });

  static List<_MediumFeedItem> listFromFeed(RssFeed feed) {
    final List<_MediumFeedItem> items = [];
    for (RssItem item in feed.items) {
      items.add(
        _MediumFeedItem(
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
