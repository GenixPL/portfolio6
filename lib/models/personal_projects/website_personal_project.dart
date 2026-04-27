import 'package:portfolio6/models/_models.dart';

class WebsitePersonalProject extends PersonalProject {
  WebsitePersonalProject() : super(
    id: 'website',
    assetImagePath: 'assets/images/projects/website/website-banner.jpg',
    name: 'The website',
    // TODO(genix): imp
    tags: [],
    dateText: '2020 - Present',
  );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
