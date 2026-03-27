import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/gen_sliver_app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, _) {
          return [
            GenSliverAppBar(),
          ];
        },
        body: CustomScrollView(
          slivers: [
            ...[
              SliverGap(10),
              //
              Container(
                width: 50,
                height: 30,
                color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
