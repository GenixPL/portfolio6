import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.dateText,
    required this.onTap,
    required this.tags,
    required this.external,
  });

  final Widget image;
  final String title;
  final String? description;
  final String? dateText;
  final VoidCallback onTap;
  final List<String> tags;
  final bool external;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 16;

    return Center(
      child: GenGestureDetector.base(
        onTap: onTap,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: context.theme.maxHorizontalCardWidth,
          ),
          decoration: ShapeDecoration(
            color: Color(0xff_09_09_09),
            shadows: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 6,
              ),
            ],
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.theme.cornerCut),
                bottomRight: Radius.circular(context.theme.cornerCut),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: verticalPadding / 2,
                  children: [
                    ArticleTitle(title),
                    if (description != null) ArticleDescription(description ?? 'no description'),
                  ],
                ),
              ),

              SizedBox(
                height: 240,
                child: image,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: verticalPadding,
                  children: [
                    ArticleTags(tags),

                    ArticleDateWithButton(
                      onReadMore: onTap,
                      dateText: dateText,
                      external: external,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
