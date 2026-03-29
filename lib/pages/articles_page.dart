import 'package:flutter/material.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(),

          Center(
            child: Text('ARTICLES'),
          ).sliver,
        ],
      ),
    );
  }
}
