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
        // Text(
        //   'personal projects'.toUpperCase(),
        //   textAlign: TextAlign.center,
        //   style: context.theme.textTheme.titleLarge,
        // ).sliver,
        ...[
          for (Project project in personalProjects) ProjectCard(project).sliver,
        ].withGaps(context.theme.cardSpacing),
      ],
    );
  }
}
