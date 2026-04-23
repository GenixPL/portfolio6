import 'package:url_launcher/url_launcher_string.dart';
import 'package:web/web.dart' as web;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
                spacing: 8,
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
                  IconButton(
                    onPressed: () {
                      launchUrl(
                        Uri(
                          scheme: 'mailto',
                          path: _email,
                        ),
                      );
                    },
                    icon: Icon(Icons.mail_outline_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),

        Center(
          child: Column(
            children: [
              Text(
                'CV',
                style: context.theme.textTheme.headlineSmall!.copyWith(
                  fontFamily: FontFamily.cpMono.assetName,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  IconButton(
                    onPressed: () {
                      // Create an <a> element
                      final anchor = web.document.createElement('a') as web.HTMLAnchorElement;

                      anchor.href = 'assets/files/niedzialek_cv.pdf';
                      anchor.download = 'niedzialek_cv.pdf';

                      // Trigger the click
                      anchor.click();
                    },
                    icon: Icon(Icons.download_sharp),
                  ),
                  IconButton(
                    onPressed: () {
                      web.window.open('assets/files/niedzialek_cv.pdf', '_blank');
                    },
                    icon: Icon(Icons.open_in_new_sharp),
                  ),
                ],
              ),
            ],
          ),
        ),

        Center(
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(
                assetUrl: 'assets/images/github_logo.png',
                linkUrl: 'https://github.com/GenixPL',
              ),
              _buildLogo(
                assetUrl: 'assets/images/stackoverflow_logo.png',
                linkUrl: 'https://stackoverflow.com/users/12372263/genix',
              ),
              _buildLogo(
                assetUrl: 'assets/images/goodreads_logo.png',
                linkUrl: 'https://www.goodreads.com/user/show/86850107-lukasz',
              ),
              _buildLogo(
                assetUrl: 'assets/images/youtube_logo.png',
                linkUrl: 'https://www.youtube.com/@ukaszniedziaek3097',
              ),
            ],
          ),
        ),
      ].slivers.withGaps(context.theme.defaultSpacing(context)),
    );
  }

  Widget _buildLogo({
    required String assetUrl,
    required String linkUrl,
  }) {
    return MouseRegionBuilder(
      builder: (BuildContext context, bool hovered) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(1),
              child: Image.asset(
                assetUrl,
                width: 40,
                height: 40,
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: hovered ? Colors.black.withAlpha(200) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                duration: context.theme.basicAnimationDuration,
                curve: context.theme.basicAnimationCurve,
              ),
            ),
          ],
        );
      },
      onTap: () {
        launchUrlString(linkUrl);
      },
    );
  }
}
