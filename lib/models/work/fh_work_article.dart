import 'package:portfolio6/models/_models.dart';

class FhWorkArticle extends WorkArticle {
  const FhWorkArticle()
    : super(
        id: 'futurehome',
        assetImagePath: 'assets/images/work/fh/fh-banner.png',
        name: 'Futurehome',
        tags: const [
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
        positions: const ['Jr. Mobile Dev', 'Sr. Mobile Dev', 'Mobile Tech Lead'],
        description: 'Work: Smart home application',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(
        path: assetImagePath,
      ),
      const Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const Title(text: 'Position'),
      const Space.small(),
      Body(text: positions.join(', ')),

      const Space.medium(),
      const Title(text: 'Location'),
      const Space.small(),
      Body(text: location),

      const Space.medium(),
      const Title(text: 'Work'),
      const Space.small(),
      Tags(tags: tags),
      const Space.small(),
      const Body(
        text:
            'Futurehome is (/used to be) a Norwegian startup / scaleup. We produced '
            'hardware and software related to the smart housing industry. From single'
            'family homes, to apartment complexes. From "simple" light bulbs, complex '
            'energy management systems. I worked mostly on their main "Futurehome" app '
            'targeted at the single units.',
      ),

      const Space.small(),
      const Body(
        text:
            'I started working there in april 2020, remotely as it was still covid time, '
            'and while waiting for my move to Norway, I developed their native widgets '
            '(using the old widget frameworks so it was a hell), and the watchOS app.',
      ),
      const Space.small(),
      AssetImageCarousel(
        aspectRatio: 540 / 1170,
        imgPaths: [
          for (int i = 1; i <= 3; i++) 'assets/images/work/fh/1_$i.jpg',
        ],
      ),
      const Space.medium(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/lFLZhzvNi_o?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl',
      ),
      const Body(
        text: 'iOS',
        center: true,
      ),

      const Space.medium(),
      const YouTube(
        embedUrl: "https://www.youtube.com/embed/CSHAo-kaXGc?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl",
      ),
      const Body(
        text: 'Android',
        center: true,
      ),

      const Space.medium(),
      const YouTube(
        embedUrl: "https://www.youtube.com/embed/BCPDjRZ25Nw?list=PLoipzfN0Ixbgt74hq2agzL1KTs6C4uJpl",
      ),
      const Body(
        text: 'watchOS',
        center: true,
      ),

      const Space.big(),
      const Body(
        text:
            'I then moved to Oslo, and continued working with them for another 4 years. '
            'Gradually my responsibilities have increased, and I ended up being one of '
            'the key developers. Some of the things I was responsible for include:',
      ),
      const ListItem(
        text: "big chunk of the app's development;",
      ),
      const ListItem(
        text: "designing, planning and transitioning the app's code into a proper (MVVM) architecture;",
      ),
      const ListItem(
        text: 'writing lots of tests;',
      ),
      const ListItem(
        text: 'ensuring quality of the code;',
      ),
      const ListItem(
        text: 'creating and maintaining a set of internal dart packages used between several projects;',
      ),
      const ListItem(
        text: 'planning deliveries with designers and business;',
      ),
      const ListItem(
        text: 'CI/CD work for the app;',
      ),
      const ListItem(
        text: 'recruiting new people;',
      ),

      const Space.big(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/3up-bm87izc?list=PLoipzfN0IxbjLP4OxXkmnIalCasijNUqo',
      ),
      const Body(
        text: 'Pairing of our ev charger.',
        center: true,
      ),

      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 621 / 1344,
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/work/fh/2_$i.jpg',
        ],
      ),

      const Space.big(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/KH629Uzr_ck',
      ),
      const Space.small(),
      const Body(
        text: '🫡',
        center: true,
      ),

      const Space.big(),
      const Headline(
        text: 'Good People, Fun times',
        center: true,
      ),

      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 16 / 9,
        imgPaths: [
          for (int i = 1; i <= 23; i++) 'assets/images/work/fh/3_$i.jpg',
        ],
      ),

      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 540 / 1200,
        imgPaths: [
          for (int i = 1; i <= 11; i++) 'assets/images/work/fh/4_$i.jpg',
        ],
      ),

      const Space.medium(),
      const AssetImage(
        path: 'assets/images/work/fh/5_1.jpg',
      ),
    ];
  }
}
