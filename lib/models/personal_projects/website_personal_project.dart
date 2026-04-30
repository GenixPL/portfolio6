import 'package:portfolio6/models/_models.dart';

class WebsitePersonalProject extends PersonalProject {
  WebsitePersonalProject()
    : super(
        id: 'website',
        assetImagePath: 'assets/images/projects/website/website-banner.jpg',
        name: 'The website',
        tags: ['< MANY >'],
        dateText: '2020 - Present',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(path: 'assets/images/projects/website/website-banner.jpg'),

      Space.medium(),
      Headline(
        text: 'The website',
        center: true,
      ),

      Space.big(),
      Body(text: 'Blut, Schweiß und Tränen...'),
      Space.small(),
      Body(text: '...and yet another story of never-ending search for time to do personal projects.'),

      Space.big(),
      Title(text: 'First version'),
      Space.small(),
      Tags(tags: ['Flutter', 'Dart']),
      Space.medium(),
      GithubLink(url: 'https://github.com/GenixPL/portfolio'),
      Space.medium(),
      Body(
        text:
            'At that point my web programming has so far been limited to one '
            'ASP.NET course and not quite a successful attempt to use NativeScript - '
            'it can definitely be said that I had zero experience with web technologies. '
            'But! Flutter (which I knew) allowed you to write web applications, '
            'what could go wrong?',
      ),
      Space.small(),
      Body(
        text:
            "I designed the app like a mobile app, which didn't result in the best Ux. "
            "Additionally, it were the very beginnings (2020) of Flutter Web - huge "
            "performance issues.",
      ),
      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 800,
        imgPaths: [
          for (int i = 1; i <= 3; i++) 'assets/images/projects/website/1_$i.jpg',
        ],
      ),

      Space.big(),
      Title(text: 'Second version'),
      Space.small(),
      Tags(tags: ['Flutter', 'Dart']),
      Space.medium(),
      GithubLink(url: 'https://github.com/GenixPL/portfolio2'),
      Space.medium(),
      Body(
        text:
            "I liked the second version much more. I had no problem writing "
            "more advanced views (experience helps, who would have thought). However, "
            "because I was writing the second version only on my stronger "
            "computer, after firing it on a weaker one and phone, I quickly "
            "came to the conclusion that Flutter Web still had a long way to go "
            "(I saw only dark future for it, so thank god for WASM). "
            "A decision was made to rewrite it in a proper web framework.",
      ),
      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 800,
        imgPaths: [
          for (int i = 1; i <= 6; i++) 'assets/images/projects/website/2_$i.jpg',
        ],
      ),

      Space.big(),
      Title(text: 'Third version'),
      Space.small(),
      Tags(
        tags: ['React', 'HTML', 'JavaScript', 'CSS'],
      ),
      Space.small(),
      Body(
        text:
            "I chose React because I thought it might come in handy in the form of "
            "React Native. However, but after 2 days of growing hatred, I moved, "
            "at the persuasion of my colleague, to...",
      ),

      Space.big(),
      Title(text: 'Fourth version'),
      Space.small(),
      Tags(
        tags: ['Vue', 'HTML', 'JavaScript', 'CSS'],
      ),
      Space.medium(),
      GithubLink(
        url: 'https://github.com/GenixPL/portfolio4',
      ),
      Space.medium(),
      Body(
        text:
            "...to Vue and it was a good(ish) decision. However, my lack of experience in web "
            "technologies (js, html, css) was definitely not helpful when it comes to "
            "writing nice webpages. My torments had no end, as did the hours of "
            "debugging and trying to write a simple button the way I wanted it. Fortunately, "
            "step by step, somehow I moved forward, and the version lived for some years.",
      ),
      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 831,
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/projects/website/4_$i.jpg',
        ],
      ),

      Space.big(),
      Title(text: 'Fifth version'),
      Space.small(),
      Tags(
        tags: ['Flutter', 'Dart'],
      ),
      Space.medium(),
      GithubLink(
        url: 'https://github.com/GenixPL/portfolio5',
      ),
      Space.medium(),
      Body(
        text: "Yet another attempt, far from finished.",
      ),
      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 1280 / 831,
        imgPaths: [
          for (int i = 1; i <= 5; i++) 'assets/images/projects/website/5_$i.jpg',
        ],
      ),

      Space.big(),
      Title(text: 'Sixth version'),
      Space.small(),
      Tags(
        tags: ['Flutter', 'Dart', 'Flame Engine', 'Gemini'],
      ),
      Space.medium(),
      GithubLink(
        url: 'https://github.com/GenixPL/portfolio6',
      ),
      Space.medium(),
      Body(
        text: "And another one, the current one, and hopefully the last one.",
      ),
      Space.small(),
      Body(
        text:
            'Both me and Flutter Web have come a long way. '
            'WASM makes it performance-reasonable, and I have take some solid time off and '
            'finally pushed myself to write proper 1.0.0 of the website.',
      ),
    ];
  }
}
