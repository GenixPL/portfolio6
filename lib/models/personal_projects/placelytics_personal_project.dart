import 'package:portfolio6/models/_models.dart';

class PlacelyticsPersonalProject extends PersonalProject {
  PlacelyticsPersonalProject()
    : super(
        id: 'placelytics',
        assetImagePath: 'assets/images/projects/placelytics/placelytics-banner.jpg',
        name: 'Placelytics (engineering project)',
        tags: [
          'Flutter',
          'Firebase Auth',
          'Firestore',
          'Google Maps',
          'Rive',
        ],
        dateText: '8 Oct 2019 - 18 Apr 2020',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      const AssetBanner(path: 'assets/images/projects/placelytics/placelytics-banner.jpg'),
      const Space.medium(),
      const Headline(
        text: 'Placelytics',
        center: true,
      ),
      const Space.medium(),

      const Body(
        text:
            'An application created as the final engineering project. The goal '
            'was to create a system (backend, mobile, and web) to monitor '
            'and analyse places (scraped) from Google Maps.',
      ),

      const Space.medium(),
      const Title(text: 'Coauthors'),
      const Body(text: 'Karol Kłosowski'),
      const Body(text: 'Piotr Pilis'),

      const Space.medium(),
      const Title(text: 'My part'),
      const Space.small(),
      Tags(tags: tags),

      const Space.small(),
      const Body(
        text:
            'I was responsible for the whole mobile app development. These were my first '
            'steps with Flutter, which was recommended to me by our promoter, for which I should '
            'be forever grateful. Lots of mistakes, lots of initial experience.',
      ),

      const Space.big(),
      AssetImageCarousel(
        aspectRatio: 540 / 1080,
        imgPaths: [
          for (int i = 2; i <= 19; i++) 'assets/images/projects/placelytics/$i.jpg',
        ],
      ),

      const Space.big(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/h5CSd-B2x0w',
      ),
    ];
  }
}
