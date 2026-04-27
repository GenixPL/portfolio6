import 'package:portfolio6/models/_models.dart';

class LanguageAppsPersonalProject extends PersonalProject {
  LanguageAppsPersonalProject()
    : super(
        id: 'language-apps',
        assetImagePath: 'assets/images/projects/myword/myword-banner.jpg',
        name: 'Language learning apps',
        // TODO(genix): imp
        tags: [],
        dateText: '2018 - 2023',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
