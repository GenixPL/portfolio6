import 'package:portfolio6/models/_models.dart';

class LanguageAppsPersonalProject extends PersonalProject {
  LanguageAppsPersonalProject()
    : super(
        id: 'language-apps',
        assetImagePath: 'assets/images/projects/myword/myword-banner.jpg',
        name: 'Language learning apps',
        // TODO(genix): imp
        tags: [],
        dateText: '2018 - 2023',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(path: 'assets/images/projects/myword/myword-banner.jpg'),
      Space.big(),
      Headline(
        text: 'Language learning apps',
        center: true,
      ),
      Space.big(),
      Body(
        text:
            'I long wanted to create a tailor-suited application for language learning. '
            'I wanted to have my own (easily expandable) data sets, and learning modes that '
            'I deemed effective.',
      ),
      Space.small(),
      Body(
        text:
            'No ads.\n'
            'No endless repetition of the same 50 words.\n'
            'No failure limits.',
      ),
      Space.big(),

      Title(text: 'First version'),
      Space.medium(),
      Tags(
        tags: ['Android', 'Java', 'SQLite'],
      ),
      Space.medium(),
      GithubLink(url: 'https://github.com/GenixPL/WordMemoriser'),
      Space.medium(),
      Body(
        text:
            "The first version of the app was very simple and ugly, but with it my "
            "mobile programming journey has started for good, so I owe it a lot. "
            "I wrote it after having programmed for 1.5 years, where, additionally, those 1.5 "
            "years were heavily filled with other "
            "non-programming (university) subjects. In the hindsight, you can clearly see how I "
            "was solving problems I was creating myself, and the fact that I didn't quite know how things work.",
      ),
      Space.medium(),
      AssetImageCarousel(
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/projects/myword/first_version/$i.png',
        ],
      ),
    ];
  }
}
