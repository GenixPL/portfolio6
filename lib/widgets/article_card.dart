import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.item,
  });

  final MediumFeedItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(item.title ?? 'no title'),
        Text(item.publicationDate?.toIso8601String() ?? 'no pub date'),
        Text(item.tags.toString()),
        Text(item.url ?? 'bo url'),
        // Text( ?? 'no media url'),
        Image.network(item.mediaUrl ?? ''),
      ],
    );
  }
}
