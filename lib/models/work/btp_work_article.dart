import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/_work.dart';

class BtpWorkArticle extends WorkArticle {
  BtpWorkArticle()
    : super(
        id: 'beside-the-park',
        assetImagePath: 'assets/images/work/btp/btp-banner.png',
        name: 'Beside The Park',
        tags: ['Java', 'Objective-C', 'Location Services'],
        startDateText: 'Apr 2018',
        endDateText: 'September 2018',
        location: '[Warsaw]',
        positions: ['Mobile Dev'],
        description: 'Work: Tracking SDK',
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
      Body(text: positions.join(',')),

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
            'Beside The Park is a software house, and I worked '
            "on one of their clients' products - a tracking SDK, "
            "which was mainly used in London navigation-related apps.",
      ),
      Space.small(),
      Body(
        text:
            "The codebase was one of these big legacy monoliths that tried to "
            "put all possible business ideas in one place. It was written in Java "
            "and Objective-C, and at the time I was working on it, Kotlin was "
            "just getting friction, and it was still some time before Swift "
            "started doing the same.",
      ),
      Space.small(),
      Body(
        text:
            "I had tiny experience with Java and Android "
            "before starting at the company, and I remember I was given a Mac some days "
            "before my first day, so I could learn Objective-C and familiarize myself "
            "with macOS (ain't nothing scaring me).",
      ),
      Space.small(),
      Body(text: "My work consisted of:"),
      ListItem(
        text: 'writing code;',
      ),
      ListItem(
        text: "...including full test coverage;",
      ),
      ListItem(
        text:
            "fighting with location services to extract as much user "
            "data as possible (it was just before GDPR);",
      ),
      ListItem(
        text:
            "fighting with battery saving mechanisms (Samsung just started "
            "seriously caring about its battery optimizations).",
      ),
      ListItem(
        text: "expanding the SDK with GDPR consent management;",
      ),
      ListItem(
        text: "and communication with the UK-based client;",
      ),
      Space.small(),
      Body(
        text:
            "Unfortunately I wasn't able to keep up with my studies and the job "
            "at the same time, so I went to full-time studying after vacations.",
      ),
    ];
  }
}
