sealed class InternalArticleComponent {
  const InternalArticleComponent();
}

class AssetBanner extends InternalArticleComponent {
  const AssetBanner({
    required this.path,
  });

  final String path;
}

class Space extends InternalArticleComponent {
  const Space.big() : size = 64;
  const Space.medium() : size = 24;
  const Space.small() : size = 8;

  final double size;
}

class Headline extends InternalArticleComponent {
  const Headline({
    required this.text,
    required this.center,
  });

  final String text;
  final bool center;
}

class Body extends InternalArticleComponent {
  const Body({
    required this.text,
    this.center = false,
  });

  final String text;
  final bool center;
}

class Title extends InternalArticleComponent {
  const Title({
    required this.text,
  });

  final String text;
}

class Tags extends InternalArticleComponent {
  const Tags({
    required this.tags,
  });

  final List<String> tags;
}

class AssetImageCarousel extends InternalArticleComponent {
  const AssetImageCarousel({
    required this.aspectRatio,
    required this.imgPaths,
  });

  final double aspectRatio;
  final List<String> imgPaths;
}

class GithubLink extends InternalArticleComponent {
  const GithubLink({
    required this.url,
  });

  final String url;
}

class YouTube extends InternalArticleComponent {
  const YouTube({
    required this.embedUrl,
  });

  final String embedUrl;
}

class AssetApk extends InternalArticleComponent {
  const AssetApk({
    required this.path,
  });

  final String path;
}

class ListItem extends InternalArticleComponent {
  const ListItem({
    required this.text,
  });

  final String text;
}

class AssetImage extends InternalArticleComponent {
  const AssetImage({
    required this.path,
  });

  final String path;
}
