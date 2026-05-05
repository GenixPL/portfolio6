import 'package:portfolio6/models/_models.dart';

class CloxPersonalProject extends PersonalProject {
  CloxPersonalProject()
    : super(
        id: 'clox',
        assetImagePath: 'assets/images/projects/clox/clox-banner.png',
        name: 'Clox',
        tags: ['Flutter', 'Dart', 'wearOS'],
        dateText: 'Apr - May 2020',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath!,
      ),
      Space.medium(),
      Headline(
        text: 'Clox',
        center: true,
      ),

      Space.big(),
      Title(text: 'Coauthors'),
      Space.small(),
      Body(
        text: 'Martyna Wolna (designer, the main author)',
      ),

      Space.medium(),
      Title(
        text: 'My part',
      ),
      Space.small(),
      Tags(
        tags: tags,
      ),
      Space.small(),
      Body(
        text:
            'After finishing my bachelor degree, during covid, I was doing all '
            'sorts of small projects, and the universe decided to make Martyna create '
            'a post, on a polish facebook flutter group, asking whether someone would '
            'like to implement a project for her. I volunteered, got a prototype working '
            'in 3 hours, she liked it and was impressed, I was referred to an open flutter '
            'dev position by her, were I spent my next 4 years, and due (/thanks) to which '
            'I moved to Norway.',
      ),

      Space.big(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/loQ0_snbUyc',
      ),
    ];
  }
}
