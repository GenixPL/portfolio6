import 'package:flutter/material.dart';
import 'package:portfolio6/app.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/gen_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class HackathonsPage extends StatelessWidget {
  const HackathonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      pageId: 'hackathons',
      slivers: [
        ...[
          for (Hackathon hackathon in hackathons)
            ArticleCard(
              image: Image.asset(
                hackathon.assetImagePath,
                fit: BoxFit.contain,
              ),
              title: hackathon.name,
              description: hackathon.description,
              dateText: hackathon.dateText,
              onTap: () => ArticleRoute.go(context, hackathon.id),
              tags: [],
              external: false,
            ).sliver,
        ].withGaps(context.theme.cardSpacing),
      ],
    );
  }
}
