import 'package:flutter/material.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticleDateWithButton extends StatelessWidget {
  const ArticleDateWithButton({
    super.key,
    required this.onReadMore,
    required this.date,
    required this.url,
  });

  final VoidCallback onReadMore;
  final DateTime? date;
  final String? url;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < 320) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ?_buildDate(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ?_buildReadMore(),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        ?_buildDate(),
        Spacer(),
        ?_buildReadMore(),
      ],
    );
  }

  Widget? _buildDate() {
    final DateTime? date = this.date;
    if (date == null) {
      return null;
    }

    return ArticleDate(date);
  }

  Widget? _buildReadMore() {
    final String? url = this.url;
    if (url == null) {
      return null;
    }

    return ReadMore(
      onTap: onReadMore,
      external: true,
    );
  }
}
