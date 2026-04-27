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
          for (PersonalProject project in personalProjects)
            ArticleCard(
              image: project.assetImagePath != null
                  ? Image.asset(
                      project.assetImagePath!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Text(
                        'NO IMAGE',
                        style: TextStyle(
                          fontFamily: FontFamily.cpMono.assetName,
                        ),
                      ),
                    ),
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
