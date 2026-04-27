import 'package:flutter/material.dart';

class ArticleDate extends StatelessWidget {
  const ArticleDate(
    this.dateText, {
    super.key,
  });

  final String dateText;

  @override
  Widget build(BuildContext context) {
    return Text(dateText);
  }
}
