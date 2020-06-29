import 'package:buffetlocator/screens/components/bottom_tabs.dart';
import 'package:flutter/material.dart';

class PageViewItem {
  String title;
  Widget content;

  PageViewItem({this.title, this.content});
}

class PageViewCard extends StatefulWidget {
  final bool scrollable;
  final bool autoScrollTabs;
  final List<PageViewItem> items;

  PageViewCard({
    this.scrollable = false,
    this.autoScrollTabs = false,
    @required this.items,
  });

  @override
  _PageViewCardState createState() => _PageViewCardState();
}

class _PageViewCardState extends State<PageViewCard> {
  PageController _controller;
  int _selectedIndex = 0;

  Duration _duration = Duration(milliseconds: 500);
  Curve _curve = Curves.easeInOut;

  bool _isScrolling;

  List<GlobalKey> keys;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    keys = widget.items.map((i) => GlobalKey()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: NotificationListener<ScrollNotification>(
              onNotification: _onScroll,
              child: PageView(
                controller: _controller,
                physics: widget.scrollable
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                children: widget.items.map((p) => p.content).toList(),
                onPageChanged: _onPageChanged,
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.items.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  var item = widget.items[index];
                  return BottomTabCard(
                    key: keys[index],
                    label: item.title,
                    color: _selectedIndex == index
                        ? Colors.lightGreenAccent
                        : Colors.white,
                    backgroundColor: _selectedIndex == index
                        ? Colors.white30
                        : Colors.transparent,
                    onPressed: () => _onTabSelected(index),
                  );
                }),
          )
        ],
      ),
    );
  }

  void _onTabSelected(int index) async {
    await _animateScroll(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics) {
      setState(() => _selectedIndex = metrics.page.round());
      if (widget.autoScrollTabs)
        try {
          Scrollable.ensureVisible(
            keys[_selectedIndex].currentContext,
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          );
        } catch(e) {
          print(e);
        }
    }
    return false;
  }

  Future<void> _animateScroll(int page) async {
    setState(() => _isScrolling = true);
    await _controller.animateToPage(
      page,
      duration: _duration,
      curve: _curve,
    );
    setState(() => _isScrolling = false);
  }
}
