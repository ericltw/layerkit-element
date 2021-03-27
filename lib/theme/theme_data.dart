import 'package:meta/meta.dart';

import './style.dart';
import './typography.dart';

@immutable
class LEThemeData {
  const LEThemeData({
    this.style = const LEStyle(),
    this.typography = const LETypography(),
  });

  final LEStyle style;

  final LETypography typography;
}
