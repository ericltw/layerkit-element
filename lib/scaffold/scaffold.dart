import 'package:flutter/widgets.dart';

import '../bottom_tab_bar/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

Color _getBackgroundColor(BuildContext context) {
  final LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasPrimary;
}

class LEScaffold extends StatelessWidget {
  const LEScaffold({
    Key key,
    @required this.body,
    this.bottomWidget,
    this.bottomWidgetHeight,
  })  : assert(body != null),
        super(key: key);

  final Widget body;

  final Widget bottomWidget;

  final double bottomWidgetHeight;

  double _getBodyPaddingBottom() {
    return bottomWidget != null ? bottomWidgetHeight ?? kBottomBarHeight : 0.0;
  }

  Widget _buildPaddedBody(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(
        top: mediaQueryData.padding.top,
        bottom: _getBodyPaddingBottom(),
      ),
      child: body,
    );
  }

  Widget _buildBottomTabBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: bottomWidget,
    );
  }

  Widget _buildScaffold(BuildContext context) {
    List<Widget> stacked = [];

    stacked.add(_buildPaddedBody(context));
    if (bottomWidget != null) {
      stacked.add(_buildBottomTabBar());
    }

    return LEMaterial(
      color: _getBackgroundColor(context),
      child: Stack(
        children: stacked,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildScaffold(context);
  }
}