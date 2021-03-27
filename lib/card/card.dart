import 'package:flutter/widgets.dart';

import '../avatar/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

const double _kSpacerIdentifierContent = 24.0;
const double _kSpacerContentFooter = 32.0;
const double _kSpacerAvatarSecondaryIdentifier = 12.0;

const EdgeInsets _kMargin = EdgeInsets.symmetric(
  horizontal: 16.0,
);
const EdgeInsets _kPadding = EdgeInsets.symmetric(
  horizontal: 26.0,
  vertical: 32.0,
);

const BorderRadius _kBorderRadius = BorderRadius.all(
  Radius.circular(24.0),
);

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasSecondary;
}

TextStyle _getIdentifierTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.h2.apply(
    color: themeData.style.contentHeavy,
  );
}

TextStyle _getContentTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.body1.apply(
    color: themeData.style.contentPreview,
  );
}

TextStyle _getSecondaryIdentifierTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.subhead.apply(
    color: themeData.style.contentHeavy,
  );
}

TextStyle _getNoteTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.subhead.apply(
    color: themeData.style.contentPreview,
  );
}

class LECard extends StatelessWidget {
  const LECard({
    Key key,
    @required this.identifier,
    @required this.content,
    @required this.identifierAvatar,
    @required this.secondaryIdentifier,
    @required this.note,
  }) : assert(identifier != null),
       assert(content != null),
       assert(identifierAvatar != null),
       assert(secondaryIdentifier != null),
       assert(note != null);

  final String identifier;

  final String content;

  final ImageProvider identifierAvatar;

  final String secondaryIdentifier;

  final String note;

  Widget _buildIdentifier(BuildContext context) {
    return Text(
      identifier,
      style: _getIdentifierTextStyle(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Text(
      content,
      style: _getContentTextStyle(context),
    );
  }

  Widget _buildIdentifierAvatar() {
    return LEAvatar(
      size: AvatarSize.medium,
      image: identifierAvatar,
    );
  }

  Widget _buildSecondaryIdentifier(BuildContext context) {
    return Text(
      secondaryIdentifier,
      style: _getSecondaryIdentifierTextStyle(context),
    );
  }

  Widget _buildNote(BuildContext context) {
    return Text(
      note,
      style: _getNoteTextStyle(context),
    );
  }

  Widget _buildFooter(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIdentifierAvatar());
    children.add(SizedBox(width: _kSpacerAvatarSecondaryIdentifier));
    children.add(_buildSecondaryIdentifier(context));
    children.add(Spacer());
    children.add(_buildNote(context));

    return Row(
      children: children,
      crossAxisAlignment: CrossAxisAlignment.center,

    );
  }
  
  Widget _buildCard(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIdentifier(context));
    children.add(SizedBox(height: _kSpacerIdentifierContent));
    children.add(_buildContent(context));
    children.add(SizedBox(height: _kSpacerContentFooter));
    children.add(_buildFooter(context));

    return Padding(
      padding: _kMargin,
      child: SizedBox(
        width: double.infinity,
        child: LEMaterial(
          color: _getBackgroundColor(context),
          borderRadius: _kBorderRadius,
          child: Padding(
            padding: _kPadding,
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );

  }
  
  @override
  Widget build(BuildContext context) {
    return _buildCard(context);
  }
}