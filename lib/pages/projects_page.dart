import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [
        ...[
          for (Project project in personalProjects)
            ArticleCard(
              image: project.assetImagePath != null
                  ? Image.asset(
                      project.assetImagePath!,
                      fit: BoxFit.cover,
                    )
                  : Icon(Icons.image),
              title: project.name,
              description: null,
              dateText: project.dateText,
              onTap: () => print('TAP'),
              tags: project.tags,
              external: false,
            ).sliver,
        ].withGaps(context.theme.cardSpacing),
      ],
    );
  }
}
