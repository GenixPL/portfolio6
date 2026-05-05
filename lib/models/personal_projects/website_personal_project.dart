import 'package:portfolio6/models/_models.dart';

class WebsitePersonalProject extends PersonalProject {
  const WebsitePersonalProject()
    : super(
        id: 'website',
        assetImagePath: 'assets/images/projects/website/website-banner.jpg',
        name: 'The website',
        tags: const [
          'Flutter',
          'Dart',
          'React',
          'HTML',
          'JavaScript',
          'CSS',
          'Vue',
          'Flame Engine',
          'Gemini',
        ],
        dateText: '2020 - Present',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      const AssetBanner(
        path: 'assets/images/projects/website/website-banner.jpg',
      ),

      const Space.medium(),
      const Headline(
        text: 'The website',
        center: true,
      ),

      const Space.big(),
      const Body(text: 'Blut, Schweiß und Tränen...'),
      const Space.small(),
      const Body(
        text: '...and yet another story of never-ending search for time to do personal projects.',
      ),

      const Space.big(),
      const Title(text: 'First version'),
      const Space.small(),
      const Tags(tags: ['Flutter', 'Dart']),
      const Space.medium(),
      const GithubLink(url: 'https://github.com/GenixPL/portfolio'),
      const Space.medium(),
      const Body(
        text:
            'At that point my web programming has so far been limited to one '
            'ASP.NET course and not quite a successful attempt to use NativeScript - '
            'it can definitely be said that I had zero experience with web technologies. '
            'But! Flutter (which I knew) allowed you to write web applications, '
            'what could go wrong?',
      ),
      const Space.small(),
      const Body(
        text:
            "I designed the app like a mobile app, which didn't result in the best UX. "
            "Additionally, it were the very beginnings (2020) of Flutter Web - huge "
            "performance issues.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 800,
        imgPaths: [
          for (int i = 1; i <= 3; i++) 'assets/images/projects/website/1_$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Second version'),
      const Space.small(),
      const Tags(tags: ['Flutter', 'Dart']),
      const Space.medium(),
      const GithubLink(url: 'https://github.com/GenixPL/portfolio2'),
      const Space.medium(),
      const Body(
        text:
            "I liked the second version much more. I had no problem writing "
            "more advanced views (experience helps, who would have thought). However, "
            "because I was writing the second version only on my stronger "
            "computer, after firing it on a weaker one and phone, I quickly "
            "came to the conclusion that Flutter Web still had a long way to go "
            "(I saw only dark future for it, so thank god for WASM). "
            "A decision was made to rewrite it in a proper web framework.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 800,
        imgPaths: [
          for (int i = 1; i <= 6; i++) 'assets/images/projects/website/2_$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Third version'),
      const Space.small(),
      const Tags(
        tags: ['React', 'HTML', 'JavaScript', 'CSS'],
      ),
      const Space.small(),
      const Body(
        text:
            "I chose React because I thought it might come in handy in the form of "
            "React Native. However, but after 2 days of growing hatred, I moved, "
            "at the persuasion of my colleague, to...",
      ),

      const Space.big(),
      const Title(text: 'Fourth version'),
      const Space.small(),
      const Tags(
        tags: ['Vue', 'HTML', 'JavaScript', 'CSS'],
      ),
      const Space.medium(),
      const GithubLink(
        url: 'https://github.com/GenixPL/portfolio4',
      ),
      const Space.medium(),
      const Body(
        text:
            "...to Vue and it was a good(ish) decision. However, my lack of experience in web "
            "technologies (js, html, css) was definitely not helpful when it comes to "
            "writing nice webpages. My torments had no end, as did the hours of "
            "debugging and trying to write a simple button the way I wanted it. Fortunately, "
            "step by step, somehow I moved forward, and the version lived for some years.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 831,
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/projects/website/4_$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Fifth version'),
      const Space.small(),
      const Tags(
        tags: ['Flutter', 'Dart'],
      ),
      const Space.medium(),
      const GithubLink(
        url: 'https://github.com/GenixPL/portfolio5',
      ),
      const Space.medium(),
      const Body(
        text: "Yet another attempt, far from finished.",
      ),
      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 831,
        imgPaths: [
          for (int i = 1; i <= 5; i++) 'assets/images/projects/website/5_$i.jpg',
        ],
      ),

      const Space.big(),
      const Title(text: 'Sixth version'),
      const Space.small(),
      const Tags(
        tags: ['Flutter', 'Dart', 'Flame Engine', 'Gemini'],
      ),
      const Space.medium(),
      const GithubLink(
        url: 'https://github.com/GenixPL/portfolio6',
      ),
      const Space.medium(),
      const Body(
        text: "And another one, the current one, and hopefully the last one.",
      ),
      const Space.small(),
      const Body(
        text:
            'Both me and Flutter Web have come a long way. '
            'WASM makes it performance-reasonable, and I have take some solid time off and '
            'finally pushed myself to write proper 1.0.0 of the website.',
      ),

      const Space.medium(),
      const Body(
        text:
            "One of interesting problems that I encountered, and that tickled my engineering soul, "
            "was a problem originating from that WASM - JS battle. Most of the website is written "
            "in Dart (compiled to WASM), but I wanted to preserve that original YouTube player look "
            "(these 3rd party players look  completely out of place / fake). Which could be "
            "achieved by injecting an HTML iframe into the Dart widget tree. Which worked. But now the "
            "scrolling, which is handled by Dart, over that element didn't work, because that element "
            "goes outside of its control. After some googling, gemining, and trying different "
            "things, I realized that it was not something that could be changed, so I ended up "
            "displaying thumbnails on the pages that can scroll (all of them can), here Gemini helped "
            "again by giving me YouTube urls to the thumbnails, and the thumbnails navigate to a separate, "
            "non-scrollable, dialog that includes the \"native\" YouTube iframe.",
      ),
      const Space.small(),
      const Body(
        text: 'Plus the thumbnails load faster.',
      ),
    ];
  }
}
