import 'package:portfolio6/models/_models.dart';

class ThgPersonalProject extends PersonalProject {
  const ThgPersonalProject()
    : super(
        id: 'the-hardest-game',
        assetImagePath: 'assets/images/projects/thg/thg-banner.jpg',
        name: 'The Hardest Game',
        tags: const [
          'Flutter',
          'Dart',
          'Rive',
        ],
        dateText: null,
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      const AssetBanner(path: 'assets/images/projects/thg/thg-banner.jpg'),
      const Space.medium(),
      const Headline(
        text: 'The Hardest Game',
        center: true,
      ),

      const Space.big(),
      const AssetApk(
        path: 'assets/files/the_hardest_game.apk',
      ),

      const Space.medium(),
      const Body(
        text:
            'A simple but difficult puzzle game for smartphones. Its aim '
            'is to find the right sequence of moves to get from point A to '
            'point B. Making each move is connected with the addition of '
            'points, the total number of which must not exceed the allowed threshold.',
      ),

      const Space.medium(),
      const Title(text: 'Coauthors'),
      const Space.small(),
      const Body(
        text: 'Rafał Dziuryk (the main author)',
      ),

      const Space.medium(),
      const Title(text: 'My part'),
      const Space.small(),
      Tags(tags: tags),
      const Space.medium(),
      const Body(
        text: "My only interference in the project was graphic overhaul.",
      ),
      const Space.small(),
      const Body(
        text:
            "Rafał published a post on a Flutter forum about his project, and I found "
            "the game so cool that I couldn't leave it in the same graphic state "
            "as it was - very simple UI elements and lack of support for different "
            "screen sizes and horizontal view.",
      ),

      const Space.big(),
      AssetImageCarousel(
        aspectRatio: 540 / 1080,
        imgPaths: [
          for (int i = 1; i <= 6; i++) 'assets/images/projects/thg/$i.jpg',
        ],
      ),

      const Space.big(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/KSW5koz3zkU',
      ),
    ];
  }
}
