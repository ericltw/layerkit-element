import 'package:flutter/widgets.dart';

import '../material/index.dart';
import '../theme/index.dart';

const double _kDividerHeight = 1.0;

Color _getColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.divider;
}

class LEDivider extends StatelessWidget {
  const LEDivider({
    Key key,
  }) : super(key: key);

  Widget _buildDivider(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: _kDividerHeight,
      child: LEMaterial(
        color: _getColor(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDivider(context);
  }
}