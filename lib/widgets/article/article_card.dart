import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.item,
  });

  final MediumFeedItem item;

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = 16;
    const double verticalPadding = 16;

    void onTap()  => launchUrlString(item.url);

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
                    ArticleTitle(item.title),
                    if (item.description != null) ArticleDescription(item.description ?? 'no description'),
                  ],
                ),
              ),

              SizedBox(
                height: 240,
                child: Image.network(
                  item.mediaUrl,
                  fit: BoxFit.cover,
                ),
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
                    ArticleTags(item.tags),

                    ArticleDateWithButton(
                      onReadMore: onTap,
                      date: item.publicationDate,
                      url: item.url,
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
