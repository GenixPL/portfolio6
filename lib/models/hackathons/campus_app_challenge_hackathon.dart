import 'package:portfolio6/models/hackathons/hackathon.dart';
import 'package:portfolio6/models/internal_article_component.dart';

class CampusAppChallengeHackathon extends Hackathon {
  CampusAppChallengeHackathon()
    : super(
        id: 'campus-app-challenge',
        duration: '24h',
        organizer: 'indoorway / daftcode',
        name: 'Campus App Challenge',
        dateText: '13-4 Jan 2018',
        assetImagePath: 'assets/images/hackathons/campus_app_challenge/campus_app_challenge.jpg',
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
      const GithubLink(
        url: 'https://github.com/GenixPL/xz_Hackathon',
      ),

      const Space.medium(),
      const Body(
        text:
            'Our group of 4 spent 24h writing an app that helped students to move around our '
            "(Faculty of Mathematics and Information Science's) building.",
      ),
      const Space.small(),
      const Body(
        text:
            'Indoorway used its bluetooth beacon mapping technology to map out the building, '
            "and gave us their SDK to play with it. Using triangulation we were presenting user's "
            "position of the internal map, and navigating him to his point of choice.",
      ),
    ];
  }
}
