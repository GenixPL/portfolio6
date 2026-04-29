import 'package:portfolio6/models/_models.dart';

// TODO(genix): add the two flutter challenges from my shorts
class FhWorkArticle extends WorkArticle {
  FhWorkArticle()
    : super(
        id: 'futurehome',
        assetImagePath: 'assets/images/work/fh/fh-banner.png',
        name: 'Futurehome',
        tags: [
          'Flutter',
          'Dart',
          'Kotlin',
          'Swift',
          'Native Home Widgets',
          'watchOS',
          'Mqtt',
          'Bluetooth',
          'gRPC',
          'REST',
          'Fastlane',
          'GitHub Actions',
        ],
        startDateText: 'Apr 2020',
        endDateText: 'May 2024',
        location: '[Warsaw, Oslo]',
        positions: ['Jr. Mobile Dev', 'Sr. Mobile Dev', 'Mobile Tech Lead'],
        description: 'Work: Smart home application',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath,
      ),
      Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      Space.big(),
      Title(text: 'Position'),
      Space.small(),
      Body(text: positions.join(', ')),

      Space.medium(),
      Title(text: 'Location'),
      Space.small(),
      Body(text: location),

      Space.medium(),
      Title(text: 'Work'),
      Space.small(),
      Body(
        text:
            'Futurehome is (/used to be) a Norwegian startup / scaleup. We produced '
            'hardware and software related to the smart housing industry. From single'
            'family homes, to apartment complexes. From "simple" light bulbs, complex '
            'energy management systems. I worked mostly on their main "Futurehome" app '
            'targeted at the single units.',
      ),

      Space.small(),
      Body(
        text:
            'I started working there in april 2020, remotely as it was still covid time, '
            'and while waiting for my move to Norway, I developed their native widgets '
            '(using the old widget frameworks so it was a hell), and the watchOS app.',
      ),
      Space.small(),
      AssetImageCarousel(
        aspectRatio: 540 / 1170,
        imgPaths: [
          for (int i = 1; i <= 3; i++) '/Users/genix/Projects/portfolio6/assets/images/work/fh/1_$i.jpg',
        ],
      ),
      Space.medium(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/lFLZhzvNi_o?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl',
      ),
      Body(
        text: 'iOS',
        center: true,
      ),

      Space.medium(),
      YouTube(
        embedUrl: "https://www.youtube.com/embed/CSHAo-kaXGc?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl",
      ),
      Body(
        text: 'Android',
        center: true,
      ),

      Space.medium(),
      // TODO(genix): scroll doesnt work over yt (pointer_interceptor)
      YouTube(
        embedUrl: "https://www.youtube.com/embed/BCPDjRZ25Nw?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl",
      ),
      Body(
        text: 'watchOS',
        center: true,
      ),

      Space.big(),
      Body(
        text:
            'I then moved to Oslo, and continued working with them for another 4 years. '
            'Gradually my responsibilities have increased, and I ended up being one of '
            'the key developers. Some of the things I was responsible for include:',
      ),
      ListItem(
        text: "big chunk of the app's development;",
      ),
      ListItem(
        text: "designing, planning and transitioning the app's code into a proper (MVVM) architecture;",
      ),
      ListItem(
        text: 'writing lots of tests;',
      ),
      ListItem(
        text: 'ensuring quality of the code;',
      ),
      ListItem(
        text: 'ensuring quality of the code;',
      ),
      ListItem(
        text: 'creating and maintaining a set of internal dart packages used between several projects;',
      ),
      ListItem(
        text: 'planning deliveries with designers and business;',
      ),
      ListItem(
        text: 'CI/CD work for the app;',
      ),
      ListItem(
        text: 'recruiting new people;',
      ),

      Space.big(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/3up-bm87izc?list=PLoipzfN0IxbjLP4OxXkmnIalCasijNUqo',
      ),
      Body(
        text: 'Pairing of our ev charger.',
        center: true,
      ),

      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 621 / 1344,
        imgPaths: [
          for (int i = 1; i <= 8; i++) '/Users/genix/Projects/portfolio6/assets/images/work/fh/2_$i.jpg',
        ],
      ),

      Space.big(),
      YouTube(
        embedUrl: 'https://www.youtube.com/embed/KH629Uzr_ck',
      ),
      Space.small(),
      Body(
        text: '🫡',
        center: true,
      ),

      Space.big(),
      Headline(
        text: 'Good People, Fun times',
        center: true,
      ),

      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 16 / 9,
        imgPaths: [
          for (int i = 1; i <= 23; i++) '/Users/genix/Projects/portfolio6/assets/images/work/fh/3_$i.jpg',
        ],
      ),

      Space.medium(),
      AssetImageCarousel(
        aspectRatio: 540 / 1200,
        imgPaths: [
          for (int i = 1; i <= 11; i++) '/Users/genix/Projects/portfolio6/assets/images/work/fh/4_$i.jpg',
        ],
      ),

      Space.medium(),
      AssetImage(
        path: '/Users/genix/Projects/portfolio6/assets/images/work/fh/5_1.jpg',
      ),
    ];
  }
}
