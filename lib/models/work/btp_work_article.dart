import 'package:portfolio6/models/internal_article_component.dart';
import 'package:portfolio6/models/work/_work.dart';

class BtpWorkArticle extends WorkArticle {
  BtpWorkArticle()
    : super(
        id: 'beside-the-park',
        assetImagePath: 'assets/images/work/btp/btp-banner.png',
        name: 'Beside The Park',
        tags: ['Java', 'Objective-C', 'Location Services'],
        startDateText: 'Apr 2018',
        endDateText: 'September 2018',
        location: '[Warsaw]',
        positionText: 'Position: Mobile Dev',
        description: 'Work: Tracking SDK',
      );

  @override
  List<InternalArticleComponent> get components {
    return [];
  }
}
