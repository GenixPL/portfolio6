import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart' hide Title, AssetImage;
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
    final InternalArticle? article = internalArticles.firstWhereOrNull(
      (e) => e.id == widget.id,
    );

    return PageWrapper(
      pageId: 'article-${widget.id}',
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
      child: Text(
        'ARTICLE NOT FOUND',
        style: TextStyle(
          fontFamily: FontFamily.cpMono.assetName,
          color: context.theme.colorScheme.error,
        ),
      ),
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
            YouTube() => _buildYouTubeSliver(component),
            AssetApk() => _buildAssetApkSliver(component),
            ListItem() => _buildListItemSliver(component),
            AssetImage() => _buildAssetImageSliver(component),
            WebLink() => _buildWebLinkSliver(component),
            MediumLink() => _buildMediumLinkSliver(component),
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
      textAlign: body.center ? TextAlign.center : null,
      style: _bodyTextStyle,
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
      aspectRatio: assetImageCarousel.aspectRatio,
      maxHeight: min(600, MediaQuery.sizeOf(context).height - 100),
      children: [
        for (String path in assetImageCarousel.imgPaths)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ExpandableImage(
              image: Image.asset(path),
            ),
          ),
      ],
    ).sliver;
  }

  Widget _buildGithubLinkSliver(GithubLink githubLink) {
    return LogoWithLink(
      onTap: () => launchUrlString(githubLink.url),
      text: githubLink.url,
      logo: Image.asset('assets/images/logos/github_logo.png'),
    ).sliver;
  }

  Widget _buildYouTubeSliver(YouTube youTube) {
    return YouTubePlayer(
      url: youTube.embedUrl,
    ).sliver;
  }

  Widget _buildAssetApkSliver(AssetApk assetApk) {
    final String fileName = assetApk.path.split('/').last;

    return LogoWithLink(
      onTap: () => downloadFile(
        assetPath: assetApk.path,
      ),
      text: fileName,
      logo: Image.asset('assets/images/logos/apk_logo.png'),
    ).sliver;
  }

  Widget _buildListItemSliver(ListItem listItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          '-',
          style: _bodyTextStyle,
        ),

        Flexible(
          child: Text(
            listItem.text,
            style: _bodyTextStyle,
          ),
        ),
      ],
    ).sliver;
  }

  Widget _buildAssetImageSliver(AssetImage assetImage) {
    return Center(
      child: Image.asset(
        assetImage.path,
      ),
    ).sliver;
  }

  Widget _buildWebLinkSliver(WebLink webLink) {
    return LogoWithLink(
      onTap: () => launchUrlString(webLink.url),
      text: webLink.url,
      logo: const Icon(Icons.public_sharp),
    ).sliver;
  }

  Widget _buildMediumLinkSliver(MediumLink mediumLink) {
    return LogoWithLink(
      onTap: () => launchUrlString(mediumLink.url),
      text: mediumLink.url,
      logo: Image.asset(
        'assets/images/logos/medium_logo.png',
      ),
    ).sliver;
  }

  TextStyle get _bodyTextStyle {
    return context.theme.textTheme.bodyLarge!;
  }
}
