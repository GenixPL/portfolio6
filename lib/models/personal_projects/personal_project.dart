import 'package:portfolio6/models/_models.dart';

abstract class PersonalProject implements InternalArticle {
  const PersonalProject({
    required this.id,
    required this.assetImagePath,
    required this.name,
    required this.tags,
    required this.dateText,
  });

  @override
  final String id;

  final String? assetImagePath;

  final String name;

  final List<String> tags;

  final String? dateText;

  @override
  List<InternalArticleComponent> get components;
}
