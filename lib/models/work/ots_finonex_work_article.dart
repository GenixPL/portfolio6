import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/work_article.dart';

class OtsFinonexWorkArticle extends WorkArticle {
  const OtsFinonexWorkArticle()
    : super(
        id: 'ots-finonex',
        assetImagePath: 'assets/images/work/ots-finonex/ots-finonex-banner.png',
        name: 'On The Spot Development / Finonex',
        tags: const [
          'Flutter',
          'Dart',
          'Design System',
        ],
        startDateText: 'Sep 2026 - Present',
        endDateText: null,
        location: '[Warsaw, Remote]',
        positions: const ['Sr. Mobile Dev'],
        description: 'Work: Trading App',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath,
      ),
      const Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const Title(text: 'Position'),
      const Space.small(),
      Body(text: positions.join(', ')),

      const Space.medium(),
      const Title(text: 'Location'),
      const Space.small(),
      Body(text: location),

      const Space.medium(),
      const Title(text: 'Work'),

      const Space.small(),
      Tags(tags: tags),

      const Space.small(),
      const Body(
        text:
            "Flutter and investing are amongst my favourite things in life, "
            "so developing trading apps seems like one of the best combos. "
            "Let's hope the future together will be long and fruitful.",
      ),
    ];
  }
}
