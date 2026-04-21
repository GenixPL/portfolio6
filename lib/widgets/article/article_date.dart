import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleDate extends StatelessWidget {
  const ArticleDate(
    this.date, {
    super.key,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${date.day}'
      ' ${DateFormat.MMM().format(DateTime(0, date.month))}'
      '${date.year == DateTime.now().year ? "" : " ${date.year}"}',
    );
  }
}
