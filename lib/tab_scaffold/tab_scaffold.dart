import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:layerkit/action_handler/index.dart';
import 'package:layerkit/bottom_tab_bar/change_active_button_event.dart';

import '../bottom_tab_bar/index.dart';
import '../scaffold/index.dart';

class LETabScaffold extends StatefulWidget {
  const LETabScaffold({
    @required this.tabBuilder,
    @required this.bottomTabBar,
  })  : assert(tabBuilder != null),
        assert(bottomTabBar != null);

  final IndexedWidgetBuilder tabBuilder;

  final LEBottomTabBar bottomTabBar;

  @override
  _LETabScaffoldState createState() => _LETabScaffoldState();
}

class _LETabScaffoldState extends State<LETabScaffold> {
  int _currentIndex = 0;
  StreamSubscription _eventSubscription;

  void _onEvent(ActionEvent event) {
    if (event is ChangeActiveBtnEvent) {
      setState(() {
        _currentIndex = event.index;
      });
    }
  }

  void _subscribeEvent() {
    _eventSubscription = actionHandler.event.listen(_onEvent);
  }

  @override
  void initState() {
    super.initState();
    _subscribeEvent();
  }

  void _unsubscribeEvent() {
    _eventSubscription.cancel();
  }

  @override
  void dispose() {
    _unsubscribeEvent();
    super.dispose();
  }

  Widget _buildBody() {
    return Builder(
      builder: (BuildContext context) {
        return widget.tabBuilder(context, _currentIndex);
      },
    );
  }

  Widget build(BuildContext context) {
    return LEScaffold(
      body: _buildBody(),
      bottomWidget: widget.bottomTabBar,
    );
  }
}
