import 'package:flutter/material.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/gen_sliver_app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(),

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
        ],
      ),
    );
  }
}
