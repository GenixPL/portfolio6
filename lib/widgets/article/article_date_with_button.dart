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
    return GenWrap(
      first: _buildDate() ?? const SizedBox(),
      second: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: _buildReadMore() ?? const SizedBox(),
      ),
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
