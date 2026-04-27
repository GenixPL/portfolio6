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
  });

  final String text;
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
    required this.imgPaths,
  });

  final List<String> imgPaths;
}

class GithubLink extends InternalArticleComponent {
  const GithubLink({
    required this.url,
  });

  final String url;
}
