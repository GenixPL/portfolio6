import 'package:portfolio6/models/_models.dart';

abstract class WorkArticle implements InternalArticle {
  const WorkArticle({
    required this.id,
    required this.assetImagePath,
    required this.name,
    required this.tags,
    required this.startDateText,
    required this.endDateText,
    required this.location,
    required this.positionText,
    required this.description,
  });

  @override
  final String id;

  final String assetImagePath;

  final String name;

  final List<String> tags;

  final String startDateText;

  final String? endDateText;

  final String location;

  final String positionText;


  final String description;

  String get descriptionText {
    return '$positionText\n$description';
  }

  String get dateText {
    String text = startDateText;

    if (endDateText != null) {
      text += ' - $endDateText';
    }

    text += '\n$location';

    return text;
  }

  @override
  List<InternalArticleComponent> get components;
}
