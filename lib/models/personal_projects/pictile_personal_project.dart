import 'package:portfolio6/models/_models.dart';

class PictilePersonalProject extends PersonalProject{
  PictilePersonalProject() : super(
    id: 'pictile',
    assetImagePath: 'assets/images/projects/pictile/pictile-banner.jpg',
    name: 'Pictile',
    // TODO(genix): imp
    tags: [],
    // TODO(genix): add
    dateText: null,
  );


  @override
  List<InternalArticleComponent> get components {
    return [];
  }

}
