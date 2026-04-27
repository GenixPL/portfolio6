import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:portfolio6/models/_models.dart';

class InternalArticlePage extends StatelessWidget {
  const InternalArticlePage({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  Widget build(BuildContext context) {
    final InternalArticle? article = internalArticles.firstWhereOrNull((e) => e.id == id);
    if (article == null) {
      return _buildNotFound();
    }

    return Text('found');
  }

  Widget _buildNotFound() {
    return Text('not found');
  }
}
