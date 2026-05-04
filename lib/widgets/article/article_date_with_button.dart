import 'package:flutter/material.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticleDateWithButton extends StatelessWidget {
  const ArticleDateWithButton({
    super.key,
    required this.onReadMore,
    required this.dateText,
    required this.external,
  });

  final VoidCallback onReadMore;
  final String? dateText;
  final bool external;

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
    final String? dateText = this.dateText;
    if (dateText == null) {
      return null;
    }

    return ArticleDate(dateText);
  }

  Widget? _buildReadMore() {
    return ReadMore(
      onTap: onReadMore,
      external: external,
    );
  }
}
