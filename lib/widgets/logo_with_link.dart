import 'package:flutter/material.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class LogoWithLink extends StatelessWidget {
  const LogoWithLink({
    super.key,
    required this.onTap,
    required this.text,
    required this.logo,
  });

  final VoidCallback onTap;
  final String text;
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Logo(
          onTap: onTap,
          child: logo,
        ),
        Gap(8),
        GenGestureDetector.base(
          onTap: onTap,
          child: SelectionContainer.disabled(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
