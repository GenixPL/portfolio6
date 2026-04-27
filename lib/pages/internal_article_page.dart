import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Title;
import 'package:portfolio6/models/_models.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Stateful because of how much context is used
// (and passing it would be annoying).
class InternalArticlePage extends StatefulWidget {
  const InternalArticlePage({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<InternalArticlePage> createState() => _InternalArticlePageState();
}

class _InternalArticlePageState extends State<InternalArticlePage> {
  @override
  Widget build(BuildContext context) {
    final InternalArticle? article = internalArticles.firstWhereOrNull((e) => e.id == widget.id);

    return PageWrapper(
      slivers: [
        if (article == null)
          _buildNotFoundSliver()
        else
          _buildArticleSliver(
            article: article,
          ),
      ],
    );
  }

  Widget _buildNotFoundSliver() {
    return Center(
      // TODO(genix): imp
      child: Text('not found'),
    ).sliver;
  }

  Widget _buildArticleSliver({
    required InternalArticle article,
  }) {
    return SliverMainAxisGroup(
      slivers: [
        for (InternalArticleComponent component in article.components)
          switch (component) {
            AssetBanner() => _buildAssetBannerSliver(component),
            Headline() => _buildHeadlineSliver(component),
            Space() => _buildSpaceSliver(component),
            Body() => _buildBodySliver(component),
            Title() => _buildTitleSliver(component),
            Tags() => _buildTagsSliver(component),
            AssetImageCarousel() => _buildAssetImageCarouselSliver(component),
            GithubLink() => _buildGithubLinkSliver(component),
          },
      ],
    );
  }

  Widget _buildAssetBannerSliver(AssetBanner assetBanner) {
    return Image.asset(assetBanner.path).sliver;
  }

  Widget _buildHeadlineSliver(Headline headline) {
    return Text(
      headline.text,
      textAlign: headline.center ? TextAlign.center : TextAlign.start,
      style: context.theme.textTheme.headlineSmall,
    ).sliver;
  }

  Widget _buildSpaceSliver(Space space) {
    return SliverGap(space.size);
  }

  Widget _buildBodySliver(Body body) {
    return Text(
      body.text,
      style: context.theme.textTheme.bodyLarge,
    ).sliver;
  }

  Widget _buildTitleSliver(Title title) {
    return Text(
      title.text,
      style: context.theme.textTheme.titleLarge,
    ).sliver;
  }

  Widget _buildTagsSliver(Tags tags) {
    return ArticleTags(
      tags.tags,
      mouseCursor: MouseCursor.defer,
    ).sliver;
  }

  Widget _buildAssetImageCarouselSliver(AssetImageCarousel assetImageCarousel) {
    return Carousel(
      constraints: BoxConstraints.tightFor(
        height: 600,
      ),
      children: [
        for (String path in assetImageCarousel.imgPaths)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Image.asset(path),
          ),
      ],
    ).sliver;
  }

  Widget _buildGithubLinkSliver(GithubLink githubLink) {
    void onTap() => launchUrlString(githubLink.url);

    return Row(
      children: [
        Logo(
          onTap: onTap,
          child: Image.asset('assets/images/logos/github_logo.png'),
        ),
        Gap(8),
        GenGestureDetector.base(
          onTap: onTap,
          child: SelectionContainer.disabled(
            child: Text(
              githubLink.url,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    ).sliver;
  }
}
