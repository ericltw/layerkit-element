import 'package:flutter/widgets.dart';
import 'package:layerkit/bottom_tab_bar/change_active_button_event.dart';

import '../action_handler/index.dart';
import '../icon_button/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

const double kBottomBarHeight = 56.0;
const double _kSpacerBetweenIconButton = 20.0;

const EdgeInsets _kBottomBarEdgePadding = EdgeInsets.only(
  left: 28.0,
  top: 8.0,
  right: 12.0,
  bottom: 8.0,
);

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasPrimary;
}

Border _getBorder(BuildContext context) {
  return Border(
    top: BorderSide(
      // TODO: get color from themeData.
      color: Color(0xFFE8E8E8),
      width: 1.0,
      style: BorderStyle.solid,
    ),
  );
}

class LEBottomTabBar extends StatefulWidget {
  const LEBottomTabBar({
    Key key,
    @required this.icons,
  })  : assert(icons != null),
        super(key: key);

  final List<IconData> icons;

  _LEBottomTabBarState createState() => _LEBottomTabBarState();
}

class _LEBottomTabBarState extends State<LEBottomTabBar> {
  int activeIcon = 0;

  void _emitChangeActiveBtnEvent(int index) {
    actionHandler.emitEvent(
      ChangeActiveBtnEvent(
        index: index,
      ),
    );
  }

  void _onTapIconButton(int index) {
    setState(() {
      activeIcon = index;
    });
    _emitChangeActiveBtnEvent(index);
  }

  Widget _buildIconButton(BuildContext context, int index, IconData icon) {
    LEThemeData themeData = LETheme.of(context);

    return LEIconButton(
      active: activeIcon == index,
      activeIconColor: themeData.style.identifierAccent,
      inactiveIconColor: Color(0xFFE2E2E2),
      icon: icon,
      activeLabelColor: themeData.style.identifierAccent,
      inactiveLabelColor: Color(0xFFE2E2E2),
      activeNumberColor: Color(0xFFFFFFFF),
      inactiveNumberColor: themeData.style.contentPreview,
      onTap: () {
        _onTapIconButton(index);
      },
    );
  }

  Widget _buildIconButtonRow(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < widget.icons.length; i ++) {
      children.add(_buildIconButton(context, i, widget.icons[i]));
      children.add(SizedBox(width: _kSpacerBetweenIconButton));
    }

    return Row(
      children: children,
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIconButtonRow(context));
    children.add(Spacer());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildBottomTabBar(BuildContext context) {
    return LEMaterial(
      color: _getBackgroundColor(context),
      border: _getBorder(context),
      child: SizedBox(
        width: double.infinity,
        height: kBottomBarHeight,
        child: Padding(
          padding: _kBottomBarEdgePadding,
          child: _buildButtonRow(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomTabBar(context);
  }
}
