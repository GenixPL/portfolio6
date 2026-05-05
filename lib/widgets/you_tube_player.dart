import 'dart:async';
import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:web/web.dart' hide Text;

class YouTubePlayer extends StatelessWidget {
  const YouTubePlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 300,
      ),
      child: GenGestureDetector.base(
        onTap: () => _showDialog(context),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              _getMaxThumbnailUrl(),
              errorBuilder: (_, _, _) {
                return Image.network(_getDefaultThumbnailUrl());
              },
            ),
            Image.asset(
              'assets/images/yt_icon.png',
              width: 84,
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    unawaited(
      showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (context) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(
                context.theme.defaultPageHorizontalPadding(context),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: context.pop,
                        icon: const Icon(Icons.close_sharp),
                      ),
                    ],
                  ),
                  Flexible(
                    child: _Player(
                      url: url,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getVideoId() {
    final split1 = url.split('/');
    final split2 = split1.last.split('?');
    return split2.first;
  }

  String _getMaxThumbnailUrl() {
    return 'https://img.youtube.com/vi/${_getVideoId()}/maxresdefault.jpg';
  }

  String _getDefaultThumbnailUrl() {
    return 'https://img.youtube.com/vi/${_getVideoId()}/hqdefault.jpg';
  }
}

class _Player extends StatefulWidget {
  const _Player({
    required this.url,
  });

  final String url;

  @override
  State<_Player> createState() => _PlayerState();
}

class _PlayerState extends State<_Player> {
  late final String _viewId;

  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _viewId = 'iframe-${DateTime.now().millisecondsSinceEpoch}';

    ui.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      Uri uri = Uri.parse(widget.url);
      uri = uri.replace(
        queryParameters: {
          ...uri.queryParameters,
          'autoplay': '1',
          'mute': '1',
        },
      );

      return HTMLIFrameElement()
        ..src = uri.toString()
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allowFullscreen = true
        ..onLoad.listen((event) {
          _loaded = true;
          setState(() {});
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          if (!_loaded)
            const Center(
              child: GenProgressIndicator(),
            ),
          HtmlElementView(
            viewType: _viewId,
          ),
        ],
      ),
    );
  }
}
