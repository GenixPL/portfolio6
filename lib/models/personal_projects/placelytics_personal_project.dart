import 'package:portfolio6/models/_models.dart';

class PlacelyticsPersonalProject extends PersonalProject {
  PlacelyticsPersonalProject()
    : super(
        id: 'placelytics',
        assetImagePath: 'assets/images/projects/placelytics/placelytics-banner.jpg',
        name: 'Placelytics (engineering project)',
        // TODO(genix): imp
        tags: ['flutter', 'mobile'],
        dateText: '8 Oct 2019 - 18 Apr 2020',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetBanner(path: 'assets/images/projects/placelytics/placelytics-banner.jpg'),
      Space.medium(),
      Headline(
        text: 'Placelytics',
        center: true,
      ),
      Space.medium(),

      Body(
        text:
            'An application created as the final engineering project. The goal '
            'was to create a system (backend, mobile, and web) to monitor '
            'and analyse places (scraped) from Google Maps.',
      ),

      Space.medium(),
      Title(text: 'Coauthors'),
      Body(text: 'Karol Kłosowski'),
      Body(text: 'Piotr Pilis'),

      Space.medium(),
      Title(text: 'My part'),
      Space.small(),
      Tags(
        tags: [
          'Flutter',
          'Firebase Auth',
          'Firestore',
          'Google Maps',
          'Rive',
        ],
      ),

      Space.small(),
      Body(
        text:
            'I was responsible for the whole mobile app development. These were my first '
            'steps with Flutter, which was recommended to me by our promoter, for which I should '
            'be forever grateful. Lots of mistakes, lots of initial experience.',
      ),

      Space.big(),
      AssetImageCarousel(
        imgPaths: [
          for (int i = 2; i <= 19; i++) 'assets/images/projects/placelytics/$i.jpg',
        ],
      ),

      Space.big(),
      YouTube(url: 'h5CSd-B2x0w'),
    ];
  }
}
