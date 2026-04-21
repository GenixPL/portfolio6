import 'package:flutter/material.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.tags,
    required this.url,
    required this.date,
  });

  final String? title;
  final String? subtitle;
  final Widget image;
  final List<String> tags;
  final String url;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    final String? title = this.title;
    final String? subtitle = this.subtitle;
    final Widget image = this.image;
    final List<String> tags = this.tags;
    final String url = this.url;
    final DateTime? date = this.date;

    void onTap() => launchUrlString(url);

    return GenGestureDetector.base(
      onTap: onTap,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: image,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withAlpha(225),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 8,
                      children: [
                        if (title != null) ArticleTitle(title),
                        if (subtitle != null) ArticleDescription(subtitle),
                      ],
                    ),

                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ArticleTags(tags),
                        ArticleDateWithButton(
                          onReadMore: onTap,
                          date: date,
                          url: url,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
