import 'package:portfolio6/models/_models.dart';

class ThgPersonalProject extends PersonalProject {
  ThgPersonalProject() : super(
    id: 'the-hardest-game',
    assetImagePath: 'assets/images/projects/thg/thg-banner.jpg',
    name: 'The Hardest Game',
    // TODO(genix): imp
    tags: ['flutter', 'mobile'],
    dateText: null,
  );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }

}
