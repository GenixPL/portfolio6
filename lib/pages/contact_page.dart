import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String _email = 'lh.niedzialek.dev@gmail.com';

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 666,
            ),
            child: Image.asset(
              'assets/images/location.png',
            ),
          ),
        ),

        Center(
          child: Column(
            children: [
              Text(
                _email,
                style: context.theme.textTheme.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _email));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email copied!'),
                        ),
                      );
                    },
                    icon: Icon(Icons.copy_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ].slivers.withGaps(context.theme.defaultSpacing(context)),
    );
  }
}
