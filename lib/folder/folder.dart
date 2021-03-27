import 'package:flutter/widgets.dart';

import '../avatar/index.dart';
import '../divider/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

const double _kHeight = 40.0;
const double _kSpacerBetweenAvatar = 2.0;

const EdgeInsets _kPadding = EdgeInsets.only(
  left: 16.0,
  top: 10.0,
  right: 16.0,
);

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasPrimary;
}

TextStyle _getIdentifierTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  // TODO: Check the correctness of the typography use.
  return themeData.typography.head.apply(
    color: themeData.style.contentHeavy,
  );
}

class LEFolder extends StatelessWidget {
  LEFolder({
    @required this.identifier,
    this.identifierAvatars,
  }) : assert(identifier != null);

  final String identifier;

  final List<ImageProvider> identifierAvatars;

  Widget _buildIdentifier(BuildContext context) {
    return Expanded(
      child: Text(
        identifier,
        style: _getIdentifierTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildIdentifierAvatar(ImageProvider image) {
    return LEAvatar(
      size: AvatarSize.small,
      image: image,
    );
  }

  Widget _buildIdentifierAvatars() {
    List<Widget> children = [];

    for (int i = 0; i < identifierAvatars.length; i++) {
      children.add(_buildIdentifierAvatar(identifierAvatars[i]));
      if (i != identifierAvatars.length - 1) {
        children.add(SizedBox(width: _kSpacerBetweenAvatar));
      }
    }

    return Row(
      children: children,
    );
  }

  /// Include identifier and avatars.
  Widget _buildContentRow(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIdentifier(context));
    if (identifierAvatars != null) {
      children.add(_buildIdentifierAvatars());
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildFolder(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildContentRow(context));
    children.add(Spacer());
    children.add(LEDivider());

    return SizedBox(
      width: double.infinity,
      height: _kHeight,
      child: LEMaterial(
        color: _getBackgroundColor(context),
        child: Padding(
          padding: _kPadding,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildFolder(context);
  }
}
