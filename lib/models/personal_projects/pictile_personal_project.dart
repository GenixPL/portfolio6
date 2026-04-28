import 'package:portfolio6/models/_models.dart';

class PictilePersonalProject extends PersonalProject {
  PictilePersonalProject()
    : super(
        id: 'pictile',
        assetImagePath: 'assets/images/projects/pictile/pictile-banner.jpg',
        name: 'Pictile',
        tags: ['Flutter', 'Dart', 'SQLite'],
        // TODO(genix): add
        dateText: null,
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(path: 'assets/images/projects/pictile/pictile-banner.jpg'),
      Space.medium(),
      Headline(
        text: 'Pictile',
        center: true,
      ),
      Space.big(),
      GithubLink(url: 'https://github.com/GenixPL/pictile'),
      Space.medium(),
      Tags(tags: tags),
      Space.medium(),
      Body(
        text:
            "A simple application to help remember things. It consists "
            "of giving the user possibility to create their own "
            "(text - picture) sets, "
            "and learn by displaying the picture and revealing "
            "the text only after tapping.",
      ),
      Space.small(),
      Body(
        text:
            "I made it for my sister, who needed "
            "such a tool to learn biology (the existing solutions did not "
            "satisfy her). I wanted the application to be 100% free, so I didn't "
            "add any possibility to store data except for the local memory. "
            "However, I "
            "implemented data storage in such a way that the data was persisted "
            "between installations.",
      ),
      Space.big(),
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
