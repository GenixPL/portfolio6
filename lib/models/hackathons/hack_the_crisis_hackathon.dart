import 'package:portfolio6/models/hackathons/hackathon.dart';
import 'package:portfolio6/models/internal_article_component.dart';

class HackTheCrisisHackathon extends Hackathon {
  const HackTheCrisisHackathon()
    : super(
        id: 'hack-the-crisis',
        duration: '5 days',
        organizer: 'do ok / govtech',
        name: 'Hack The Crisis',
        dateText: '17-22 Mar 2020',
        assetImagePath: 'assets/images/hackathons/hack_the_crisis/hack_the_crisis.png',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetImage(
        path: assetImagePath,
      ),
      const Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const Body(
        text:
            'An application created during a 5-day hackathon to support Polish uniformed services in '
            'checking mandatory quarantines and to promote voluntary quarantines for people not '
            'covered by mandatory ones.',
      ),
      const Space.small(),
      const Body(
        text:
            'It works on the principle of checking the user\'s location '
            'every 15 minutes (in the background) and through several random verifications during '
            'the day. This verification involves taking a photo of your face and the same '
            'background (rear camera image) each time.',
      ),
      const Space.small(),
      const Body(
        text:
            'We had a bigger group of people consisting of: a designer, data guy, backend/cloud dev, '
            '"business" folks, and me (mobile dev).',
      ),

      const Space.big(),
      const AssetBanner(
        path: 'assets/images/projects/quarantino/quarantino-banner.jpg',
      ),
      const Body(
        text: 'Quarantino',
        center: true,
      ),

      const Space.medium(),
      AssetImageCarousel(
        aspectRatio: 804 / 1608,
        imgPaths: [
          for (int i = 1; i <= 8; i++) 'assets/images/projects/quarantino/$i.jpg',
        ],
      ),

      const Space.medium(),
      const YouTube(
        embedUrl: 'https://www.youtube.com/embed/JhSBDsFtAM4',
      ),
    ];
  }
}
