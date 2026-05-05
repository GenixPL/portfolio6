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
      const Space.medium(),
      const Headline(
        text: 'Clox',
        center: true,
      ),

      const Space.big(),
      const Title(text: 'Coauthors'),
      const Space.small(),
      const Body(
        text: 'Martyna Wolna (designer, the main author)',
      ),

      const Space.medium(),
      const Title(
        text: 'My part',
      ),
      const Space.small(),
      Tags(
        tags: tags,
      ),
      const Space.small(),
      const Body(
        text:
            'After finishing my bachelor degree, during covid, I was doing all '
            'sorts of small projects, and the universe decided to make Martyna create '
            'a post, on a polish facebook flutter group, asking whether someone would '
            'like to implement a project for her. I volunteered, got a prototype working '
            'in 3 hours, she liked it and was impressed, I was referred to an open flutter '
            'dev position by her, were I spent my next 4 years, and due (/thanks) to which '
            'I moved to Norway.',
      ),

      const Space.big(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/loQ0_snbUyc',
      ),
    ];
  }
}
