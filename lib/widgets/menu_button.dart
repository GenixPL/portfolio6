import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/font_family.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.onTap,
    required this.name,
    required this.routeName,
  });

  static List<Widget> buildButtons({
    required VoidCallback onTap,
  }) {
    return [
      MenuButton(
        name: 'home',
        routeName: 'home',
        onTap: onTap,
      ),
      MenuButton(
        name: 'articles',
        routeName: 'articles',
        onTap: onTap,
      ),
    ];
  }

  final VoidCallback onTap;
  final String name;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    final String? activePageName = GoRouter.of(context).state.topRoute?.name;

    return TextButton(
      onPressed: () {
        onTap();
        context.goNamed(routeName);
      },
      child: Text(
        name.toUpperCase(),
        style: TextStyle(
          fontFamily: FontFamily.cpMono.assetName,
          color: activePageName == routeName ? Theme.of(context).colorScheme.secondary : null,
        ),
      ),
    );
  }
}
