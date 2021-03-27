import 'package:flutter/widgets.dart';

import '../theme/index.dart';

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 2 / 3);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height * 2 / 3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BackgroundClipper oldClipper) => false;
}

double kBottomNavigationHeight = 92.0;
double _kBackButtonMarginLeft = 24.0;
double _kBackButtonMarginTop = 2.0;
double _kForwardButtonMarginRight = 24.0;
double _kForwardButtonMarginBottom = 26.0;

Color _getBackgroundColor(BuildContext context) {
  LEThemeData themeData = LETheme.of(context);

  return themeData.style.identifierAccent;
}

class LEBottomNavigation extends StatelessWidget {
  const LEBottomNavigation({
    this.backButton,
    this.forwardButton,
  });

  final Widget backButton;

  final Widget forwardButton;

  Widget _buildBackground(BuildContext context) {
    return ClipPath(
      clipper: BackgroundClipper(),
      child: Container(
        color: _getBackgroundColor(context),
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      left: _kBackButtonMarginLeft,
      top: _kBackButtonMarginTop,
      child: backButton,
    );
  }

  Widget _buildForwardButton() {
    return Positioned(
      right: _kForwardButtonMarginRight,
      bottom: _kForwardButtonMarginBottom,
      child: forwardButton,
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    List<Widget> children = [];

    children.add(_buildBackground(context));
    if (backButton != null) {
      children.add(_buildBackButton());
    }
    if (forwardButton != null) {
      children.add(_buildForwardButton());
    }

    return SizedBox(
      width: double.infinity,
      height: kBottomNavigationHeight,
      child: Stack(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigation(context);
  }
}
