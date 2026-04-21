import 'package:flutter/material.dart';
import 'package:portfolio6/theme/gen_theme.dart';

class ArticleDescription extends StatelessWidget {
  const ArticleDescription(
    this.text, {
    super.key,
    this.maxLines,
  });

  final String text;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: context.theme.textTheme.bodyMedium,
    );
  }
}
