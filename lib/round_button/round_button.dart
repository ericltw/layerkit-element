import 'package:flutter/widgets.dart';

import '../material/index.dart';

const double _kSize = 40.0;
const double _kIconSize = 24.0;

class LERoundButton extends StatelessWidget {
  const LERoundButton({
    @required this.color,
    @required this.iconColor,
    @required this.icon,
    @required this.onTap,
  })  : assert(color != null),
        assert(iconColor != null),
        assert(icon != null),
        assert(onTap != null);


  /// TODO: Check if we could use enum color to set
  /// the color value.
  /// Ex: RoundButtonColor.accent / RoundButtonColor.normal...
  final Color color;

  final Color iconColor;

  final IconData icon;

  final GestureTapCallback onTap;  

  Widget _buildRoundButton() {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: _kSize,
        height: _kSize,
        child: LEMaterial(
          color: color,
          shape: BoxShape.circle,
          iconThemeData: IconThemeData(
            color: iconColor,
            size: _kIconSize,
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRoundButton();
  }
}
