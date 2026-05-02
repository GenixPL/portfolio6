import 'package:portfolio6/models/_models.dart';

// TODO(genix): nicer 404 page

final List<InternalArticle> internalArticles = [
  ...personalProjects,
  ...workArticles,
  ...hackathons,
];

class InternalArticle {
  const InternalArticle({
    required this.id,
    required this.components,
  });

  final String id;
  final List<InternalArticleComponent> components;
}
