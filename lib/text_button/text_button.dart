import 'package:flutter/widgets.dart';

import './types.dart';
import '../theme/index.dart';

const Map<TextButtonSize, double> _kIconSize = {
  TextButtonSize.small: 24.0,
  TextButtonSize.large: 24.0,
};

const Map<TextButtonSize, double> _kSpacer = {
  TextButtonSize.small: 6.0,
  TextButtonSize.large: 8.0,
};

TextStyle _getTextStyle(BuildContext context, TextButtonSize size) {
  LEThemeData themeData = LETheme.of(context);

  switch(size) {
    case TextButtonSize.small:
      return themeData.typography.h3;
    case TextButtonSize.large:
      return themeData.typography.h1;
    default:
      return null;
  }
}

class LETextButton extends StatelessWidget {
  const LETextButton({
    @required this.size,
    @required this.color,
    @required this.text,
    this.prefixIcon,
    this.suffixIcon,
    @required this.onTap,
  }) : assert(size != null),
       assert(color != null),
       assert(text != null),
       assert(onTap != null);

  final TextButtonSize size;

  final Color color;

  final String text;

  final IconData prefixIcon;

  final IconData suffixIcon;

  final GestureTapCallback onTap;

  Widget _buildPrefixIcon() {
    return Icon(
      prefixIcon,
      size: _kIconSize[size],
      color: color,
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(context, size).apply(
        color: color,
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return Icon(
      suffixIcon,
      size: _kIconSize[size],
      color: color,
    );
  }

  Widget _buildTextButton(BuildContext context) {
    List<Widget> children = [];

    if (prefixIcon != null) {
      children.add(_buildPrefixIcon());
    }
    children.add(SizedBox(width: _kSpacer[size]));
    children.add(_buildText(context));
    children.add(SizedBox(width: _kSpacer[size]));
    if (suffixIcon != null) {
      children.add(_buildSuffixIcon());
    }
    
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTextButton(context);
  }
}