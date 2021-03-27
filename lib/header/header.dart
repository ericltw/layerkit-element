import 'package:flutter/widgets.dart';

import '../avatar/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

double _kHeight = 56.0;

EdgeInsets _kPadding = EdgeInsets.symmetric(
  horizontal: 16.0,
  vertical: 8.0,
);

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasPrimary;
}

TextStyle _getIdentifierTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.h1.apply(
    color: themeData.style.contentHeavy,
  );
}

class LEHeader extends StatelessWidget {
  LEHeader({
    Key key,
    @required this.identifier,
    this.identifierAvatarImage,
  })  : assert(identifier != null),
        super(key: key);

  final String identifier;

  final ImageProvider identifierAvatarImage;

  Widget _buildIdentifier(BuildContext context) {
    return Expanded(
      child: Text(
        identifier,
        style: _getIdentifierTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildIdentifierAvatar() {
    return LEAvatar(
      size: AvatarSize.large,
      image: identifierAvatarImage,
    );
  }

  Widget _buildHeader(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIdentifier(context));
    if (identifierAvatarImage != null) {
      children.add(_buildIdentifierAvatar());
    }

    return SizedBox(
      height: _kHeight,
      child: LEMaterial(
        color: _getBackgroundColor(context),
        child: Padding(
          padding: _kPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildHeader(context);
  }
}
