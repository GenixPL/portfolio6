import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/_work.dart';

class BtpWorkArticle extends WorkArticle {
  const BtpWorkArticle()
    : super(
        id: 'beside-the-park',
        assetImagePath: 'assets/images/work/btp/btp-banner.jpg',
        name: 'Beside The Park',
        tags: const ['Java', 'Objective-C', 'Location Services'],
        startDateText: 'Apr 2018',
        endDateText: 'September 2018',
        location: '[Warsaw]',
        positions: const ['Mobile Dev'],
        description: 'Work: Tracking SDK',
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
      const Title(text: 'Technologies'),
      const Space.small(),
      Tags(tags: tags),

      const Space.medium(),
      const Title(text: 'Location'),
      const Space.small(),
      Body(text: location),

      const Space.medium(),
      const Title(text: 'Work'),
      const Space.small(),
      const Body(
        text:
            'Beside The Park is a software house, and I worked '
            "on one of their clients' products - a tracking SDK, "
            "which was mainly used in London navigation-related apps.",
      ),

      const Space.big(),
      AssetImageCarousel(
        aspectRatio: 540 / 960,
        imgPaths: [
          for (int i = 1; i <= 2; i++) 'assets/images/work/btp/2_$i.jpg',
        ],
      ),

      const Space.medium(),
      const Body(
        text:
            "The codebase was one of these big legacy monoliths that tried to "
            "put all possible business ideas in one place. It was written in Java "
            "and Objective-C, and at the time I was working on it, Kotlin was "
            "just getting friction, and it was still some time before Swift "
            "started doing the same.",
      ),
      const Space.small(),
      const Body(
        text:
            "I had tiny experience with Java and Android "
            "before starting at the company, and I remember I was given a Mac some days "
            "before my first day, so I could learn Objective-C and familiarize myself "
            "with macOS (ain't nothing scaring me).",
      ),
      const Space.small(),
      const Body(text: "My work consisted of:"),
      const ListItem(
        text: 'writing code;',
      ),
      const ListItem(
        text: "...including full test coverage;",
      ),
      const ListItem(
        text:
            "fighting with location services to extract as much user "
            "data as possible (it was just before GDPR);",
      ),
      const ListItem(
        text:
            "fighting with battery saving mechanisms (Samsung just started "
            "seriously caring about its battery optimizations).",
      ),
      const ListItem(
        text: "expanding the SDK with GDPR consent management;",
      ),
      const ListItem(
        text: "and communication with the UK-based client;",
      ),
      const Space.small(),
      const Body(
        text:
            "Unfortunately I wasn't able to keep up with my studies and the job "
            "at the same time, so I went to full-time studying after vacations.",
      ),

      const Space.big(),
      AssetImageCarousel(
        aspectRatio: 4 / 3,
        imgPaths: [
          for (int i = 1; i <= 2; i++) 'assets/images/work/btp/1_$i.jpg',
        ],
      ),
    ];
  }
}
