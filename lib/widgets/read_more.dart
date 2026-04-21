import 'package:flutter/material.dart';
import 'package:portfolio6/theme/font_family.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
    required this.onTap,
    required this.external,
    this.text = 'read more',
  });

  final String text;
  final VoidCallback onTap;
  final bool external;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            // Space at the end add "padding" to the icon.
            text.toUpperCase(),
            style: TextStyle(
              fontFamily: FontFamily.cpMono.assetName,
            ),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToLastDescent: false,
            ),
          ),
          const SizedBox(width: 4),
          Icon(external ? Icons.open_in_new_sharp : Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}
