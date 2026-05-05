import 'package:portfolio6/models/_models.dart';

class PictilePersonalProject extends PersonalProject {
  PictilePersonalProject()
    : super(
        id: 'pictile',
        assetImagePath: 'assets/images/projects/pictile/pictile-banner.jpg',
        name: 'Pictile',
        tags: ['Flutter', 'Dart', 'SQLite'],
        dateText: '24 - 28 Feb 2020',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      const AssetBanner(path: 'assets/images/projects/pictile/pictile-banner.jpg'),
      const Space.medium(),
      const Headline(
        text: 'Pictile',
        center: true,
      ),
      const Space.big(),
      const GithubLink(url: 'https://github.com/GenixPL/pictile'),
      const Space.medium(),
      Tags(tags: tags),
      const Space.medium(),
      const Body(
        text:
            "A simple application to help remember things. It consists "
            "of giving the user possibility to create their own "
            "(text - picture) sets, "
            "and learn by displaying the picture and revealing "
            "the text only after tapping.",
      ),
      const Space.small(),
      const Body(
        text:
            "I made it for my sister, who needed "
            "such a tool to learn biology (the existing solutions did not "
            "satisfy her). I wanted the application to be 100% free, so I didn't "
            "add any possibility to store data except for the local memory. "
            "However, I "
            "implemented data storage in such a way that the data was persisted "
            "between installations.",
      ),
      const Space.big(),
      AssetImageCarousel(
        aspectRatio: 540 / 1080,
        imgPaths: [
          for (int i = 1; i <= 7; i++)
            'assets/images/projects/pictile/$i.jpg'
        ],
      ),
    ];
  }
}
