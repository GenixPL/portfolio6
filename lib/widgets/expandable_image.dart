import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio6/theme/_theme.dart';

class ExpandableImage extends StatelessWidget {
  const ExpandableImage({
    super.key,
    required this.image,
  });

  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          image,
          Positioned(
            right: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () => _showDialog(context),
              icon: Container(
                color: Colors.black87,
                child: const Icon(
                  Icons.fullscreen_sharp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context) {
    unawaited(
      showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(
                context.theme.defaultPageHorizontalPadding(context),
              ),
              child: Stack(
                children: [
                  image,
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: context.pop,
                      icon: Container(
                        color: Colors.black87,
                        child: const Icon(Icons.fullscreen_exit_sharp),
                      ),
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
}
