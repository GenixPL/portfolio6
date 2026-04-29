import 'package:flutter/material.dart';
import 'package:portfolio6/theme/font_family.dart';

class NoImage extends StatelessWidget {
  const NoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'NO IMAGE',
        style: TextStyle(
          fontFamily: FontFamily.cpMono.assetName,
        ),
      ),
    );
  }
}
