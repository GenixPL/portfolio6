import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/work_article.dart';

class CoopWorkArticle extends WorkArticle {
  CoopWorkArticle()
    : super(
        id: 'coop',
        assetImagePath: 'assets/images/work/coop/coop-banner.png',
        name: 'Coop Norge',
        tags: [
          'Flutter',
          'Dart',
          'Kotlin',
          'gRPC',
          'REST',
          'Fastlane',
          'GitHub Actions',
          'Aera SDK',
        ],
        startDateText: 'Jun 2024',
        endDateText: 'Jan 2026',
        location: '[Oslo]',
        positions: ['Sr. Mobile Dev'],
        description: 'Work: Retail application',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath,
      ),
      Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      Space.big(),
      Title(text: 'Position'),
      Space.small(),
      Body(text: positions.join(', ')),

      Space.medium(),
      Title(text: 'Technologies'),
      Space.small(),
      Tags(tags: tags),

      Space.medium(),
      Title(text: 'Location'),
      Space.small(),
      Body(text: location),

      Space.medium(),
      Title(text: 'Work'),
      Space.small(),
      Body(
        text:
            "I joined Coop Norge in June 2024, and I immediately was off to a great "
            "start by dislocating my knee and delaying my arrival by a week 😅.",
      ),
      Space.small(),
      Body(
        text:
            "I became part of the team when they were transitioning to a new major "
            "app version. They've done great work with designing the new codebase, and "
            "my role over the 1.5 years consisted mostly of improving what was left from "
            "the old version.",
      ),
      Space.small(),
      Body(
        text: "My main achievements were: ",
      ),
      ListItem(
        text: 'full refactor of the payment system (coopay) in the app;',
      ),
      ListItem(
        text: 'overhaul of the dependency management;',
      ),
      ListItem(
        text: 'introducing strong culture of code testing;',
      ),
      ListItem(
        text: 'creating memes;',
      ),

      Space.small(),
      Body(
        text:
            "Transition from a proper startup culture, to a rather big corporate "
            "one, was an interesting experience, and Coop is definitely a nice chill "
            "place to work at; unfortunately, they don't allow fully remote work, so "
            "our paths had to split with my decision to move back to Poland.",
      ),

      Space.big(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/iRgtH6aTODU',
      ),
      Body(
        text: 'Coopay v2 activation.',
        center: true,
      ),

      Space.big(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/iA3N7Eq3TEk',
      ),
      Body(
        text: 'Coopay v2 payment.',
        center: true,
      ),

      Space.big(),
      AssetImageCarousel(
        aspectRatio: 4 / 3,
        imgPaths: [
          for (int i = 1; i <= 14; i++)
            'assets/images/work/coop/1_$i.jpg'
        ],
      ),
    ];
  }
}
