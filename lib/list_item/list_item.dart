import 'package:flutter/widgets.dart';

import '../avatar/index.dart';
import '../label/index.dart';
import '../material/index.dart';
import '../theme/index.dart';

const double _kHeight = 80.0;
const double _kSpacerAvatarTextRows = 16.0;
const double _kPrimaryTextRowPaddingTop = 4.0;
const double _kSpacerInPrimaryTextRow = 8.0;
const double _kSpacerPrimaryPreviewTextRow = 8.0;
const double _kSpacerInPreviewTextRow = 8.0;

const EdgeInsets _kMargin = EdgeInsets.symmetric(
  horizontal: 16.0,
);
const EdgeInsets _kPadding = EdgeInsets.symmetric(
  horizontal: 12.0,
  vertical: 16.0,
);

const BorderRadius _kBorderRadius = BorderRadius.all(
  Radius.circular(10.0),
);

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.canvasSecondary;
}

TextStyle _getPrimaryIdentifierTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.subhead.apply(
    color: themeData.style.contentHeavy,
  );
}

TextStyle _getNoteTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.overline1.apply(
    color: themeData.style.contentAssistive,
  );
}

TextStyle _getPreviewTextStyle(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.typography.body2.apply(
    color: themeData.style.contentPreview,
  );
}

class LEListItem extends StatelessWidget {
  LEListItem({
    Key key,
    @required this.identifierAvatarImage,
    this.identifierAvatarStatusColor,
    @required this.primaryIdentifier,
    @required this.note,
    @required this.previewText,
    this.labelColor,
    this.labelTextColor,
    this.labelText,
  })  : assert(identifierAvatarImage != null),
        assert(primaryIdentifier != null),
        assert(note != null),
        assert(previewText != null),
        super(key: key);

  final ImageProvider identifierAvatarImage;

  final Color identifierAvatarStatusColor;

  final String primaryIdentifier;

  final String note;

  final String previewText;

  final Color labelColor;

  final Color labelTextColor;

  final String labelText;

  Widget _buildPrimaryIdentifier(BuildContext context) {
    return Expanded(
      child: Text(
        primaryIdentifier,
        style: _getPrimaryIdentifierTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildNote(BuildContext context) {
    return Text(
      note,
      style: _getNoteTextStyle(context),
    );
  }

  Widget _buildPrimaryTextRow(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildPrimaryIdentifier(context));
    children.add(SizedBox(width: _kSpacerInPrimaryTextRow));
    children.add(_buildNote(context));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildPreviewText(BuildContext context) {
    return Expanded(
      child: Text(
        previewText,
        style: _getPreviewTextStyle(context),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  bool _showLabel() {
    return labelColor != null && labelTextColor != null && labelText != null;
  }

  Widget _buildLabel() {
    return LELabel(
      size: LabelSize.small,
      color: labelColor,
      textColor: labelTextColor,
      text: labelText,
    );
  }

  Widget _buildPreviewTextRow(BuildContext context) {
    List<Widget> children = [];

    if (_showLabel()) {
      children.add(_buildPreviewText(context));
      children.add(SizedBox(width: _kSpacerInPreviewTextRow));
      children.add(_buildLabel());
    } else {
      children.add(_buildPreviewText(context));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildIdentifierAvatar() {
    return LEAvatar(
      size: AvatarSize.xlarge,
      image: identifierAvatarImage,
      statusIndicatorColor: identifierAvatarStatusColor,
    );
  }

  Widget _buildTextRows(BuildContext context) {
    List<Widget> children = [];

    children.add(SizedBox(height: _kPrimaryTextRowPaddingTop));
    children.add(_buildPrimaryTextRow(context));
    children.add(SizedBox(height: _kSpacerPrimaryPreviewTextRow));
    children.add(_buildPreviewTextRow(context));

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildListItemSingle(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildIdentifierAvatar());
    children.add(SizedBox(width: _kSpacerAvatarTextRows));
    children.add(_buildTextRows(context));

    return Padding(
      padding: _kMargin,
      child: SizedBox(
        width: double.infinity,
        height: _kHeight,
        child: LEMaterial(
          color: _getBackgroundColor(context),
          borderRadius: _kBorderRadius,
          child: Padding(
            padding: _kPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildListItemSingle(context);
  }
}
