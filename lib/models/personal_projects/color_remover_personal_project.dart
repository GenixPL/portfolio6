import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/personal_projects/personal_project.dart';

class ColorRemoverPersonalProject extends PersonalProject {
  ColorRemoverPersonalProject()
    : super(
        id: 'color-remover',
        assetImagePath: 'assets/images/projects/color-remover/color-remover-banner.png',
        name: 'PyScript color remover',
        tags: ['PyScript', 'Python', 'HTML'],
        dateText: '5-11 Apr 2026',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath!,
      ),
      const Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      const Space.medium(),
      const WebLink(
        url: 'https://genixpl.github.io/color-remover',
      ),

      const Space.medium(),
      const GithubLink(
        url: 'https://github.com/GenixPL/color-remover',
      ),

      const Space.medium(),
      const Title(
        text: 'The why',
      ),
      const Space.small(),
      const Body(
        text:
            'I needed to remove some (FIXED!) background color from a few image files. I checkout '
            'Figma plugins and some web-based solutions, and all of them attempted to jump on my data, '
            'asking for emails and god knows what, and my wallet by charging ridiculous amounts per '
            'file (free tiers were limited to tiny resolutions). Additionally, some of them were '
            'AI-based and produced ugly artifacts.',
      ),

      const Space.medium(),
      const Title(
        text: 'All hail LLM',
      ),
      const Space.small(),
      const Body(
        text:
            'After 30min of searching I decided to ask Gemini to spit me out a python script doing '
            'what I wanted - taking a color and removing it from an image; 10s later I had a working '
            'solution...',
      ),

      const Space.medium(),
      const Title(
        text: 'The last step',
      ),
      const Space.small(),
      const Body(
        text:
            "I decided to host it because it wasn't the first time I needed such a thing (but the "
            "other times it was just for meme production, so I was fine with small formats). I started "
            "playing with Flask, but I quickly realised that I couldn't produce static pages (I wanted "
            "to used GitHub Pages), I checked out Frozen-Flask, but I wasn't convinced, and I ended "
            "up selecting PyScript.",
      ),
      const Space.small(),
      const Body(
        text:
            'I fought with it for a few hours, this was mostly due to my lack of web knowledge and '
            "lack of IDE support for this PyScript WASM magic (I couldn't just easily jump from code "
            "to docs, and there was no autocomplete), but after some Gemini chatting I've achieved "
            "what I wanted.",
      ),

      const Space.big(),
      // TODO(genix): add full screen image display button
      AssetImageCarousel(
        aspectRatio: 1200 / 779,
        imgPaths: [
          for (int i = 1; i <= 5; i++) 'assets/images/projects/color-remover/1_$i.jpg',
        ],
      ),
    ];
  }
}
