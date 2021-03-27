import 'package:flutter/widgets.dart';

import '../label/index.dart';

const double _kIconButtonWidth = 36.0;
const double _kIconButtonHeight = 34.0;
const double _kIconSize = 30.0;

class LEIconButton extends StatelessWidget {
  const LEIconButton({
    @required this.active,
    @required this.activeIconColor,
    @required this.inactiveIconColor,
    @required this.icon,
    @required this.activeLabelColor,
    @required this.inactiveLabelColor,
    @required this.activeNumberColor,
    @required this.inactiveNumberColor,
    this.number,
    @required this.onTap,
  })  : assert(active != null),
        assert(activeIconColor != null),
        assert(inactiveIconColor != null),
        assert(icon != null),
        assert(activeLabelColor != null),
        assert(inactiveLabelColor != null),
        assert(activeNumberColor != null),
        assert(inactiveNumberColor != null),
        assert(onTap != null);

  final bool active;

  final Color activeIconColor;

  final Color inactiveIconColor;

  final IconData icon;

  final Color activeLabelColor;

  final Color inactiveLabelColor;

  final Color activeNumberColor;

  final Color inactiveNumberColor;

  final int number;

  final GestureTapCallback onTap;

  Color _getIconColor() {
    return active ? activeIconColor : inactiveIconColor;
  }

  Widget _buildIcon() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Icon(
        icon,
        size: _kIconSize,
        color: _getIconColor(),
      ),
    );
  }

  Color _getLabelColor() {
    return active ? activeLabelColor : inactiveLabelColor;
  }

  Color _getLabelTextColor() {
    return active ? activeNumberColor : inactiveNumberColor;
  }

  Widget _buildLabel() {
    return Align(
      alignment: Alignment.topRight,
      child: LELabel(
        size: LabelSize.small,
        color: _getLabelColor(),
        textColor: _getLabelTextColor(),
        text: '$number',
      ),
    );
  }

  Widget _buildIconButton() {
    List<Widget> children = [];

    children.add(_buildIcon());
    if (number != null) {
      children.add(_buildLabel());
    }

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: _kIconButtonWidth,
        height: _kIconButtonHeight,
        child: Stack(
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIconButton();
  }
}
