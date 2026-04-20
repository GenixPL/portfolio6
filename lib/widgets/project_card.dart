import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard(
    this.project, {
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: context.theme.maxHorizontalCardWidth,
        ),
        height: 400,
        decoration: ShapeDecoration(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(context.theme.cornerCut),
              topRight: Radius.circular(context.theme.cornerCut),
            ),
          ),
          color: Colors.black,
        ),
        child: Row(
          children: [

          ],
        ),
      ),
    );
  }
}
