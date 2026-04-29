import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/work_article.dart';

class CoopWorkArticle extends WorkArticle {
  CoopWorkArticle()
    : super(
        id: 'coop',
        assetImagePath: 'assets/images/work/coop/coop-banner.png',
        name: 'Coop Norge',
        tags: [
          'Flutter',
          'Dart',
          'Kotlin',
          'gRPC',
          'REST',
          'Fastlane',
          'GitHub Actions',
          'Aera SDK',
        ],
        startDateText: 'Jun 2024',
        endDateText: 'Jan 2026',
        location: '[Oslo]',
        positions: ['Sr. Mobile Dev'],
        description: 'Work: Retail application',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
