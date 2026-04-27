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
    return [];
  }
}
