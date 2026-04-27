import 'package:flutter/material.dart';

class ArticleTags extends StatelessWidget {
  const ArticleTags(
    this.tags, {
    super.key,
    this.mouseCursor = SystemMouseCursors.click,
  });

  final List<String> tags;
  final MouseCursor mouseCursor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (String tag in tags)
          Chip(
            // Without this, web on mobile has bigger vertical spacing.
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            mouseCursor: mouseCursor,
            label: Text(
              tag,
              style: TextStyle(
                height: 1.0,
              ),
              textHeightBehavior: TextHeightBehavior(
                applyHeightToLastDescent: false,
              ),
            ),
          ),
      ],
    );
  }
}
