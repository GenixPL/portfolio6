import 'package:portfolio6/models/_models.dart';

class LanguageAppsPersonalProject extends PersonalProject {
  LanguageAppsPersonalProject()
    : super(
        id: 'language-apps',
        assetImagePath: 'assets/images/projects/myword/myword-banner.jpg',
        name: 'Language learning apps',
        tags: ['< MANY >'],
        dateText: '2018 - 2023',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(path: 'assets/images/projects/myword/myword-banner.jpg'),
      Space.medium(),
      Headline(
        text: 'Language learning apps',
        center: true,
      ),
      Space.big(),
      Body(
        text:
            'I had long wanted to create a tailor-suited application for language learning. '
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

      Space.big(),
      Title(text: 'Second version'),
      Space.medium(),
      Tags(
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
      Space.medium(),
      GithubLink(url: 'https://github.com/GenixPL/easyLearn'),
      Space.medium(),
      Body(
        text:
            "I decided to write the second version in NativeScript because I liked "
            "the possibility of writing one code for mobile and web.",
      ),
      Space.small(),
      Body(
        text: 'Big mistake.',
      ),
      Space.small(),
      Body(
        text:
            "NativeScript was terrible; tiny community and too few plugins. "
            "The fact that it was my first encounter with web technologies (Angular) did not "
            "make things any easier, it resulted in a pretty quick defeat.",
      ),
      Space.medium(),
      AssetImageCarousel(
        imgPaths: [for (int i = 1; i <= 14; i++) 'assets/images/projects/myword/second_version/$i.jpg'],
      ),

      Space.big(),
      Title(text: 'Third version'),
      Space.medium(),
      Tags(
        tags: [
          'Flutter',
          'Dart',
          'Firebase Auth',
          'Firestore',
          'Google Translation API',
        ],
      ),
      Space.medium(),
      GithubLink(url: 'https://github.com/GenixPL/my-word'),
      Space.medium(),
      Body(
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
      Space.small(),
      Body(
        text: '...again.',
      ),
      Space.small(),
      Space.medium(),
      AssetImageCarousel(
        imgPaths: [for (int i = 1; i <= 10; i++) 'assets/images/projects/myword/third_version/$i.jpg'],
      ),

      Space.big(),
      Title(text: 'Fourth version'),
      // TODO(genix): add
      Body(
        text: 'TODO: add',
      ),
    ];
  }
}
