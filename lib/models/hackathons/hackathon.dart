import 'package:portfolio6/models/_models.dart';

abstract class Hackathon implements InternalArticle {
  const Hackathon({
    required this.id,
    required this.duration,
    required this.organizer,
    required this.name,
    required this.dateText,
    required this.assetImagePath,
  });

  @override
  final String id;

  final String duration;

  final String organizer;

  final String name;

  final String dateText;

  final String assetImagePath;

  @override
  List<InternalArticleComponent> get components;
}
