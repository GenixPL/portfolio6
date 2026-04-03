import 'package:flutter/material.dart';
import 'package:portfolio6/theme/_theme.dart';
import 'package:portfolio6/utils/_utils.dart';
import 'package:portfolio6/widgets/_widgets.dart';
import 'package:web/web.dart' as web;

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
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _containerKey = GlobalKey();

  OverlayEntry? _overlayEntry;
  bool _showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          // Hide if menu is shown.
          scrollbars: !_showMenu,
        ),
        child: _optionalRefreshWrap(
          child: CustomScrollView(
            physics: _showMenu ? NeverScrollableScrollPhysics() : (isMobile ? AlwaysScrollableScrollPhysics() : null),
            controller: _scrollController,
            slivers: [
              GenSliverAppBar(
                containerKey: _containerKey,
                menuOpen: _showMenu,
                onMenuTap: _onMenuTap,
              ),
              ...widget.slivers,
            ],
          ),
        ),
      ),
    );
  }

  Widget _optionalRefreshWrap({required Widget child}) {
    if (!isMobile) {
      return child;
    }

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        // This triggers a hard reload of the page in the browser
        web.window.location.reload();
      },
      child: child,
    );
  }

  void _onMenuTap() {
    if (_overlayEntry != null) {
      _hideMenu();
      return;
    }

    _showMenu = true;
    setState(() {});

    _overlayEntry = OverlayEntry(
      builder: (_) {
        final RenderBox renderBox = _containerKey.currentContext?.findRenderObject() as RenderBox;
        final height = renderBox.size.height;

        return Padding(
          padding: EdgeInsets.only(
            top: height,
          ),
          child: _buildMenu(),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildMenu() {
    return AnimatedOpacity(
      opacity: _showMenu ? 1.0 : 0.0,
      curve: context.theme.basicAnimationCurve,
      duration: context.theme.basicAnimationDuration,
      child: GestureDetector(
        onTap: _hideMenu,
        child: Container(
          color: Colors.black.withAlpha(240),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: MenuButton.buildButtons(
                onTap: _hideMenu,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _hideMenu() {
    _showMenu = false;
    setState(() {});
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
      return;
    }
  }
}
