import 'package:flutter/material.dart';
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
        Text(
          'Commercial Projects'.toUpperCase(),
          textAlign: TextAlign.center,
          style: context.theme.textTheme.titleLarge,
        ).sliver,
      ],
    );
  }
}
