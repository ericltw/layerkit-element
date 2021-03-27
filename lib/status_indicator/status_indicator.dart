import 'package:flutter/widgets.dart';
import '../material/index.dart';

const double _kSize = 12.0;
const double _kBorderWidth = 2.0;

class LEStatusIndicator extends StatelessWidget {
  const LEStatusIndicator({
    Key key,
    @required this.color,
    @required this.borderColor,
  })  : assert(color != null),
        assert(borderColor != null),
        super(key: key);

  final Color color;

  final Color borderColor;

  Widget _buildPresenceIndicator(BuildContext context) {
    return SizedBox(
      width: _kSize,
      height: _kSize,
      child: LEMaterial(
        color: color,
        border: Border.all(
          color: borderColor,
          width: _kBorderWidth,
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPresenceIndicator(context);
  }
}