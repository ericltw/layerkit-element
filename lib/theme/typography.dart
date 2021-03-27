import 'package:flutter/painting.dart';
import 'package:meta/meta.dart';

@immutable
class LETypography {
  const LETypography({
    // TODO: inherited: false,
    this.h1 = const TextStyle(
      fontSize: 24.0,
      letterSpacing: 0.24,
      height: 1.0,
      fontFamily: 'Roboto',
    ),
    this.h2 = const TextStyle(
      fontSize: 24.0,
      height: 1.6,
      fontFamily: 'Roboto',
    ),
    this.h3 = const TextStyle(
      fontSize: 20.0,
      height: 1.2,
      fontFamily: 'Roboto',
    ),
    this.h4 = const TextStyle(
      fontSize: 36.0,
      height: 1.2,
      letterSpacing: 0.28,
      fontFamily: 'Roboto',
    ),
    this.head = const TextStyle(
      fontSize: 16.0,
      letterSpacing: -0.08,
      height: 1.0,
      fontFamily: 'Roboto',
    ),
    this.subhead = const TextStyle(
      fontSize: 14.0,
      height: 1.0,
      fontFamily: 'Roboto',
    ),
    this.body1 = const TextStyle(
      fontSize: 18.0,
      letterSpacing: -0.4,
      height: 1.6,
      fontFamily: 'Roboto',
    ),
    this.body2 = const TextStyle(
      fontSize: 15.0,
      height: 1.35,
      fontFamily: 'Roboto',
    ),
    this.overline1 = const TextStyle(
      fontSize: 12.0,
      letterSpacing: 0.24,
      height: 1.0,
      fontFamily: 'Roboto',
    ),
    this.caption = const TextStyle(
      fontSize: 14.0,
      height: 1.0,
      fontFamily: 'Roboto',
    ),
  });

  final TextStyle h1;

  final TextStyle h2;

  final TextStyle h3;

  final TextStyle h4;

  // TODO: Check the naming of head.
  final TextStyle head;

  final TextStyle subhead;

  final TextStyle body1;

  final TextStyle body2;

  final TextStyle overline1;

  final TextStyle caption;
}
