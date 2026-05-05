import 'package:portfolio6/models/_models.dart';

class TribalWarsNotificationsPersonalProject extends PersonalProject {
  const TribalWarsNotificationsPersonalProject()
    : super(
        id: 'tribal-wars-notifications',
        assetImagePath: null,
        name: 'Tribal Wars Notifications',
        tags: const [
          'Android',
          'Kotlin',
        ],
        dateText: '2 - 8 Oct 2018',
      );

  @override
  List<InternalArticleComponent> get components {
    return [
      Headline(
        text: name,
        center: true,
      ),

      const Space.big(),
      const GithubLink(
        url: 'https://github.com/GenixPL/Tribal-Wars-Notifications',
      ),
      const Space.medium(),
      Tags(
        tags: tags,
      ),

      const Space.medium(),
      const Body(
        text:
            'An app that was creating background processes in order to monitor system '
            'notifications, and trigger an alarm if there was one coming from Tribal Wars '
            '(an online game crated by InnoGames).',
      ),
      const Space.small(),
      const Body(
        text:
            'The purpose of it was to be informed, as soon as possible (including'
            '/mainly during sleep), about incoming enemy attack, so that we (me '
            'and my tribe) could gain an edge. It required turning off all battery '
            'optimizations and background limitations in order to function properly.',
      ),
    ];
  }
}
