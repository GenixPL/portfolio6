import 'package:flutter/material.dart';
import 'package:portfolio6/app.dart';
import 'package:portfolio6/models/work/_work.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      pageId: 'work',
      slivers: [
        ...[
          for (WorkArticle work in workArticles)
            ArticleCard(
              image: Image.asset(
                work.assetImagePath,
                fit: BoxFit.cover,
              ),
              title: work.name,
              description: work.descriptionText,
              dateText: work.dateText,
              onTap: () => ArticleRoute.go(context, work.id),
              tags: work.tags,
              external: false,
            ).sliver,
        ].withGaps(context.theme.cardSpacing),
      ],
    );
  }
}
