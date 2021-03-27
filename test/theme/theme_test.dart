import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

int buildCount;
LEThemeData actualThemeData;

Widget _buildTheme({
  LEThemeData themeData,
}) {
  return LETheme(
    themeData: themeData,
    child: Builder(
      builder: (BuildContext context) {
        buildCount++;
        actualThemeData = LETheme.of(context);
        return const Placeholder();
      },
    ),
  );
}

void main() {
  setUp(() {
    buildCount = 0;
    actualThemeData = null;
  });

  testWidgets('Reading themes creates dependencies',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildTheme(
        themeData: LEThemeData(
          style: LEStyle(
            canvasPrimary: Color(0xFF000000),
          ),
        ),
      ),
    );
    expect(buildCount, 1);
    expect(actualThemeData.style.canvasPrimary, Color(0xFF000000));

    await tester.pumpWidget(
      _buildTheme(
        themeData: LEThemeData(
          style: LEStyle(
            canvasPrimary: Color(0xFF111111),
          ),
        ),
      ),
    );
    expect(buildCount, 2);
    expect(actualThemeData.style.canvasPrimary, Color(0xFF111111));
  });
}
