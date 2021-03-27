import 'package:flutter/widgets.dart';

import './types.dart';
import '../material/index.dart';
import '../status_indicator/index.dart';
import '../theme/index.dart';

const Map<AvatarSize, double> _kSize = {
  AvatarSize.xsmall: 16.0,
  AvatarSize.small: 20.0,
  AvatarSize.medium: 24.0,
  AvatarSize.large: 40.0,
  AvatarSize.xlarge: 48.0,
};

const Map<AvatarSize, double> _kBorderWidth = {
  AvatarSize.xsmall: 1.0,
  AvatarSize.small: 1.0,
  AvatarSize.medium: 1.0,
  AvatarSize.large: 2.0,
  AvatarSize.xlarge: 2.0,
};

Color _getDefaultBorderColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  // TODO: Check the correctness of the color use.
  return themeData.style.canvasPrimary;
}

class LEAvatar extends StatelessWidget {
  const LEAvatar({
    Key key,
    @required this.size,
    @required this.image,
    this.borderColor,
    this.statusIndicatorColor,
  })  : assert(size != null),
        assert(image != null),
        assert(!(statusIndicatorColor != null && size != AvatarSize.xlarge));

  final AvatarSize size;

  final ImageProvider image;

  final Color borderColor;

  final Color statusIndicatorColor;

  Widget _buildAvatar(BuildContext context) {
    return Positioned.fill(
      child: LEMaterial(
        image: DecorationImage(
          image: image,
        ),
        border: Border.all(
          color: borderColor ?? _getDefaultBorderColor(context),
          width: _kBorderWidth[size],
        ),
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildStatusIndicator(BuildContext context) {
    return Positioned(
      right: 0.0,
      bottom: 0.0,
      child: LEStatusIndicator(
        color: statusIndicatorColor,
        borderColor: borderColor ?? _getDefaultBorderColor(context),
      ),
    );
  }

  Widget _buildAvatarStack(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildAvatar(context));
    if (statusIndicatorColor != null) {
      children.add(_buildStatusIndicator(context));
    }

    return SizedBox(
      width: _kSize[size],
      height: _kSize[size],
      child: Stack(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildAvatarStack(context);
  }
}
