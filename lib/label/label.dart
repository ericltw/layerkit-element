import 'package:flutter/widgets.dart';

import './types.dart';
import '../material/index.dart';
import '../theme/index.dart';

const Map<LabelSize, BorderRadius> _kBorderRadius = {
  LabelSize.small: BorderRadius.all(
    Radius.circular(32.0),
  ),
  LabelSize.medium: BorderRadius.all(
    Radius.circular(32.0),
  ),
};

const Map<LabelSize, EdgeInsets> _kPadding = {
  LabelSize.small: EdgeInsets.symmetric(
    horizontal: 6.0,
    vertical: 2.0,
  ),
  LabelSize.medium: EdgeInsets.symmetric(
    horizontal: 12.0,
    vertical: 6.0,
  ),
};

TextStyle _getTextStyle(BuildContext context, Color textColor) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.overline1.apply(
    color: textColor,
  );
}

class LELabel extends StatelessWidget {
  const LELabel({
    Key key,
    @required this.size,
    @required this.color,
    @required this.textColor,
    @required this.text,
  })  : assert(size != null),
        assert(color != null),
        assert(textColor != null),
        assert(text != null);

  final LabelSize size;

  /// TODO: Check if we could use enum color to set
  /// the color of label.
  /// Ex: LabelColor.accent / LabelColor.normal...
  final Color color;

  /// TODO: Check if textColor need to be a parameter.
  /// Check if we could use color value to determine
  /// the text color.
  final Color textColor;

  final String text;

  Widget _buildLabel(BuildContext context) {
    return LEMaterial(
      color: color,
      borderRadius: _kBorderRadius[size],
      textStyle: _getTextStyle(context, textColor),
      child: Padding(
        padding: _kPadding[size],
        child: Text(text),
      ),
    );
  }

  Widget build(BuildContext context) {
    return _buildLabel(context);
  }
}
