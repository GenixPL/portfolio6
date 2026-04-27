import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart'; // Required for rootBundle
import 'package:web/web.dart' as web; // For the download logic
import 'dart:js_interop';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const String _email = 'lh.niedzialek.dev@gmail.com';

  bool _isSmallScreen(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 430;
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Image.asset(
              'assets/images/location.png',
            ),
          ),
        ),

        Center(
          child: _isSmallScreen(context) ? _buildVertical(context) : _buildHorizontal(context),
        ),
      ].slivers.withGaps(context.theme.defaultSpacing(context)),
    );
  }

  Widget _buildVertical(BuildContext context) {
    return Column(
      children: [
        _logoColumn(
          context: context,
          children: _buildSocial(context),
        ),

        Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            height: 4,
            color: Colors.black,
          ),
        ),

        _logoColumn(
          context: context,
          children: _buildOther(context),
        ),
      ],
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _logoColumn(
            context: context,
            children: _buildSocial(context),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 4,
              color: Colors.black,
            ),
          ),

          _logoColumn(
            context: context,
            children: _buildOther(context),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildOther(BuildContext context) {
    return [
      _buildLogo(
        context: context,
        child: Icon(Icons.mail_outline_sharp),
        onTap: () => launchUrl(
          // Without this web on mobile will open new tab.
          mode: LaunchMode.externalApplication,
          Uri(scheme: 'mailto', path: _email),
        ),
        text: _email,
      ),
      _buildLogo(
        context: context,
        child: Icon(Icons.download_sharp),
        // TODO(genix): update cv
        onTap: () => _downloadPdfFromAssets(
          'assets/files/niedzialek_cv.pdf',
          'niedzialek_cv.pdf',
        ),
        text: 'Resume',
      ),
    ];
  }

  List<Widget> _buildSocial(BuildContext context) {
    return [
      _buildLogo(
        context: context,
        child: Image.asset('assets/images/logos/github_logo.png'),
        onTap: () => _openUrl('https://github.com/GenixPL'),
        text: 'GitHub',
      ),
      _buildLogo(
        context: context,
        child: Image.asset('assets/images/logos/stackoverflow_logo.png'),
        onTap: () => _openUrl('https://stackoverflow.com/users/12372263/genix'),
        text: 'Stack Overflow',
      ),
      _buildLogo(
        context: context,
        child: Image.asset('assets/images/logos/goodreads_logo.png'),
        onTap: () => _openUrl('https://www.goodreads.com/user/show/86850107-lukasz'),
        text: 'Goodreads',
      ),
      _buildLogo(
        context: context,
        child: Image.asset('assets/images/logos/linkedin_logo.png'),
        onTap: () => _openUrl('https://www.linkedin.com/in/łukasz-niedziałek-12b78930b/'),
        text: 'LinkedIn',
      ),
      _buildLogo(
        context: context,
        child: Image.asset('assets/images/logos/youtube_logo.png'),
        onTap: () => _openUrl('https://www.youtube.com/@ukaszniedziaek3097'),
        text: 'YouTube',
      ),
    ];
  }

  Widget _logoColumn({
    required BuildContext context,
    required List<Widget> children,
  }) {
    final bool isSmall = _isSmallScreen(context);

    return Column(
      spacing: isSmall ? 24 : 8,
      crossAxisAlignment: isSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Future<void> _downloadPdfFromAssets(String assetPath, String fileName) async {
    try {
      // 1. Load the PDF file from assets as ByteData
      final ByteData data = await rootBundle.load(assetPath);

      // 2. Convert ByteData to Uint8List
      final Uint8List bytes = data.buffer.asUint8List();

      // 3. Create a Blob and trigger download (Modern package:web approach)
      final blob = web.Blob([bytes.toJS].toJS, web.BlobPropertyBag(type: 'application/pdf'));

      final url = web.URL.createObjectURL(blob);
      final anchor = web.document.createElement('a') as web.HTMLAnchorElement
        ..href = url
        ..download = fileName
        ..style.display = 'none';

      web.document.body?.append(anchor);
      anchor.click();

      // Cleanup
      anchor.remove();
      web.URL.revokeObjectURL(url);
    } catch (e) {
      print('Error downloading asset: $e');
    }
  }

  void _openUrl(String url) {
    launchUrlString(url);
  }

  Widget _buildLogo({
    required BuildContext context,
    required Widget child,
    required VoidCallback onTap,
    required String text,
  }) {
    final List<Widget> children = [
      Logo(
        onTap: onTap,
        child: child,
      ),
      Text(
        text,
        style: context.theme.textTheme.bodyMedium,
      ),
    ];

    if (_isSmallScreen(context)) {
      return Column(
        children: children,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: children,
    );
  }
}
