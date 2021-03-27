import 'package:flutter/widgets.dart';

import './theme_data.dart';

class LETheme extends StatelessWidget {
  const LETheme({
    Key key,
    @required this.themeData,
    @required this.child,
  })  : assert(themeData != null),
        assert(child != null),
        super(key: key);

  final LEThemeData themeData;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _LEInheritedTheme(
      themeData: themeData,
      child: child,
    );
  }

  // Changed
  static LEThemeData of(BuildContext context) {
    _LEInheritedTheme inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_LEInheritedTheme>();
    return inheritedTheme?.themeData ?? const LEThemeData();
  }
}

class _LEInheritedTheme extends InheritedWidget {
  _LEInheritedTheme({
    Key key,
    @required this.themeData,
    @required Widget child,
  })  : assert(themeData != null),
        assert(child != null),
        super(key: key, child: child);

  final LEThemeData themeData;

  bool updateShouldNotify(Widget oldWidget) => true;
}
