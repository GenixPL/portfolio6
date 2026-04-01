import 'package:flutter/material.dart';
import 'package:portfolio6/widgets/gen_sliver_app_bar.dart';
import 'package:sliver_tools/sliver_tools.dart';

class PageWrapper extends StatefulWidget {
  const PageWrapper({
    super.key,
    required this.slivers,
  });

  final List<Widget> slivers;

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          GenSliverAppBar(
            onMenuTap: () {
              _showMenu = !_showMenu;
              setState(() {});
            },
          ),
          SliverStack(
            children: [
              SliverMainAxisGroup(
                slivers: widget.slivers,
              ),
              if (_showMenu)
                SliverFillRemaining(
                  child: Container(
                    color: Colors.yellow,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
