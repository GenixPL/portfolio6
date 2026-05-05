import 'package:portfolio6/models/_models.dart';

class LanguageAppsPersonalProject extends PersonalProject {
  const LanguageAppsPersonalProject()
    : super(
        id: 'language-apps',
        assetImagePath: 'assets/images/projects/myword/myword-banner.jpg',
        name: 'Language learning apps',
        tags: const ['< MANY >'],
        dateText: '2018 - 2023',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      const AssetBanner(
        path: 'assets/images/projects/myword/myword-banner.jpg',
      ),
      const Space.medium(),
      const Headline(
        text: 'Language learning apps',
        center: true,
      ),
      const Space.big(),
      const Body(
        text:
            'I had long wanted to create a tailor-suited application for language learning. '
            'I wanted to have my own (easily expandable) data sets, and learning modes that '
            'I deemed effective.',
      ),
      const Space.small(),
      const Body(
        text:
            'No ads.\n'
            'No endless repetition of the same 50 words.\n'
            'No failure limits.',
      ),

      const Space.big(),
      const Title(text: 'First version'),
      const Space.medium(),
      const Tags(
        tags: ['Android', 'Java', 'SQLite'],
      ),
      const Space.medium(),
      const GithubLink(url: 'https://github.com/GenixPL/WordMemoriser'),
      const Space.medium(),
      const Body(
        text:
            "The first version of the app was very simple and ugly, but with it my "
            "mobile programming journey has started for good, so I owe it a lot. "
            "I wrote it after having programmed for 1.5 years, where, additionally, those 1.5 "
            "years were heavily filled with other "
            "non-programming (university) subjects. In the hindsight, you can clearly see how I "
            "was solving problems I was creating myself, and the fact that I didn't quite know how things work.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 540 / 1110,
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/projects/myword/first_version/$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Second version'),
      const Space.medium(),
      const Tags(
        tags: [
          'NativeScript',
          'Firebase Auth',
          'Facebook Login',
          'Firestore',
          'TypeScript',
          'HTML',
          'CSS',
        ],
      ),
      const Space.medium(),
      const GithubLink(url: 'https://github.com/GenixPL/easyLearn'),
      const Space.medium(),
      const Body(
        text:
            "I decided to write the second version in NativeScript because I liked "
            "the possibility of writing one code for mobile and web.",
      ),
      const Space.small(),
      const Body(
        text: 'Big mistake.',
      ),
      const Space.small(),
      const Body(
        text:
            "NativeScript was terrible; tiny community and too few plugins. "
            "The fact that it was my first encounter with web technologies (Angular) did not "
            "make things any easier, it resulted in a pretty quick defeat.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 437 / 778,
        imgPaths: [
          for (int i = 1; i <= 14; i++) 'assets/images/projects/myword/second_version/$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Third version'),
      const Space.medium(),
      const Tags(
        tags: [
          'Flutter',
          'Dart',
          'Firebase Auth',
          'Firestore',
          'Google Translation API',
        ],
      ),
      const Space.medium(),
      const GithubLink(url: 'https://github.com/GenixPL/my-word'),
      const Space.medium(),
      const Body(
        text:
            "With the third version I already had some experience "
            "(3 years), but I decided to write it in Flutter... "
            "in which I had no experience at that time (can't be too easy). It took me long "
            "time to play with widgets and work out the mechanics of the framework. "
            "When the first working version was nearing completion, I had to fully devote myself "
            "to the last semester of studies, so the project was not finished "
            "for over six months. During that time I learned a lot, "
            'so before I could finish the application, I "had to" rewrite it...',
      ),
      const Space.small(),
      const Body(
        text: '...again.',
      ),
      const Space.small(),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 540 / 1080,
        imgPaths: [
          for (int i = 1; i <= 10; i++) 'assets/images/projects/myword/third_version/$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Fourth version'),
      // TODO(genix): add
      const Body(
        text: 'TODO: add',
      ),
    ];
  }
}
