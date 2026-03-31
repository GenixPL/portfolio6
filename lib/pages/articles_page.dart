import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
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
  List<MediumFeedItem>? _mediumItems;

  @override
  void initState() {
    super.initState();
    _init();
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
    _mediumItems = MediumFeedItem.listFromFeed(rss);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<MediumFeedItem>? mediumItems = _mediumItems;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(),

          ...[
                if (mediumItems == null)
                  Center(
                    child: CircularProgressIndicator(),
                  ).sliver
                else
                  ...[
                    for (MediumFeedItem item in mediumItems)
                      ArticleCard(
                        item: item,
                      ).sliver,
                  ].withGaps(24),
              ]
              .withPadding(context.theme.minPageVerticalPadding)
              .withHorizontalPadding(context.theme.minPageHorizontalPadding),
        ].withSafeArea(),
      ),
    );
  }
}
