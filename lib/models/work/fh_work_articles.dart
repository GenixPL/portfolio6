import 'package:portfolio6/models/_models.dart';

class FhWorkArticle extends WorkArticle {
  FhWorkArticle()
    : super(
        id: 'futurehome',
        assetImagePath: 'assets/images/work/fh/fh-banner.png',
        name: 'Futurehome',
        tags: [
          'Flutter',
          'Dart',
          'Kotlin',
          'Swift',
          'Native Home Widgets',
          'Mqtt',
          'Bluetooth',
          'gRPC',
          'REST',
          'Fastlane',
          'GitHub Actions',
        ],
        startDateText: 'Apr 2020',
        endDateText: 'May 2024',
        location: '[Warsaw, Oslo]',
        positionText: 'Positions: Jr. Mobile Dev, Sr. Mobile Dev, Mobile Tech Lead',
        description: 'Work: Smart home application',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
