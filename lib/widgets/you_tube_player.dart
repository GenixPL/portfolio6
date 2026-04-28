import 'dart:ui_web' as ui;

import 'package:flutter/material.dart';
import 'package:web/web.dart';

class YouTubePlayer extends StatefulWidget {
  const YouTubePlayer({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<YouTubePlayer> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late final String _viewId;

  @override
  void initState() {
    super.initState();
    _viewId = 'iframe-${DateTime.now().millisecondsSinceEpoch}';

    ui.platformViewRegistry.registerViewFactory(_viewId, (int viewId) {
      return HTMLIFrameElement()
        ..src = widget.url
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allowFullscreen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewId);
  }
}
