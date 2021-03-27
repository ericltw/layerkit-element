import 'package:flutter/painting.dart';
import 'package:meta/meta.dart';

@immutable
class LEStyle {
  const LEStyle({
    this.canvasPrimary = const Color(0xFFFFFFFF),
    this.canvasSecondary = const Color(0xFFF6F6F6),
    this.contentHeavy = const Color(0xFF1A1A1A),
    this.contentPreview = const Color(0xFF4A4A4A),
    this.contentAssistive = const Color(0xFF999999),
    this.identifierAccent = const Color(0xFF5258D1),
    this.identifierNormal = const Color(0xFF555555),
    this.identifierAssistive = const Color(0xFFFFAB00),
    this.identifierWarn = const Color(0xFFFF5630),
    this.identifierSilent = const Color(0xFFF3F3F3),
    this.identifierProcess = const Color(0xFF0052CC),
    this.identifierAvailable = const Color(0xFF36B37E),
    this.identifierFrontOnDark = const Color(0xFFFFFFFF),
    this.identifierFrontOnLight = const Color(0xFF3C3C3C),
    this.divider = const Color(0xFFEFEFEF),
  });

  final Color canvasPrimary;

  final Color canvasSecondary;

  final Color contentHeavy;

  final Color contentPreview;

  final Color contentAssistive;

  final Color identifierAccent;

  final Color identifierNormal;

  final Color identifierAssistive;

  final Color identifierWarn;

  final Color identifierSilent;

  final Color identifierProcess;

  final Color identifierAvailable;

  final Color identifierFrontOnDark;

  final Color identifierFrontOnLight;

  final Color divider;
}