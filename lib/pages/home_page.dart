import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        Row(
          children: [
            Dino(
              onTap: () {
                context.goNamed('dino');
              },
            ),
          ],
        ).sliver,

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
