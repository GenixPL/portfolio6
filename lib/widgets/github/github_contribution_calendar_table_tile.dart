import 'package:flutter/material.dart';

import 'package:portfolio6/theme/gen_theme.dart';

class GithubContributionCalendarTableTile extends StatelessWidget {
  const GithubContributionCalendarTableTile({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.lerp(
          Colors.grey.shade900,
          context.theme.secondary,
          _getColorT(value),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(1)),
      ),
    );
  }

  double _getColorT(int value) {
    return switch (value) {
      0 => 0.0,
      < 5 => 0.2,
      < 10 => 0.4,
      < 15 => 0.6,
      < 20 => 0.8,
      _ => 1.0,
    };
  }
}
