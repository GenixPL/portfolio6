import 'package:flutter/material.dart';
import 'package:portfolio6/theme/gen_theme.dart';

class ArticleTitle extends StatelessWidget {
  const ArticleTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.titleMedium,
    );
  }
}
