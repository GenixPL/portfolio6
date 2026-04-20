import 'package:dino_game/dino_game.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      slivers: [

        Dino().sliver,

        Container(
          width: 50,
          height: 300,
          color: Colors.redAccent,
        ).sliver,

        Container(
          width: 50,
          height: 300,
          color: Colors.amber,
        ).sliver,
      ].withHorizontalPadding(32),
    );
  }
}
