import 'package:portfolio6/models/hackathons/hackathon.dart';
import 'package:portfolio6/models/internal_article_component.dart';

class FacebookHackathon extends Hackathon {
  const FacebookHackathon() : super(
      id: 'facebook-hackathon',
      duration: '24h',
      organizer: 'Facebook',
      name: 'Facebook Hackathon',
      dateText: '19-20 May 2018',
      assetImagePath: 'assets/images/hackathons/facebook/facebook.png',
  );

  @override
  List<InternalArticleComponent> get components {
    return [
      AssetImage(
        path: assetImagePath,
      ),
      Space.medium(),
      Headline(
        text: name,
        center: true,
      ),

      Space.big(),
      GithubLink(
        url: 'https://github.com/GenixPL/fb_hackathon',
      ),

      Space.medium(),
      Body(
        text:
        'Our group of 3 spent 24h writing an app that allowed people to create, and join, socializing '
            'activities (something like Meetup).',
      ),
    ];
  }
}
