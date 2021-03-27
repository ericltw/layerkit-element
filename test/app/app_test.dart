import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

void main() {
  testWidgets('Theme parameter', (WidgetTester tester) async {
    final LEThemeData themeData = LEThemeData(
      style: LEStyle(
        canvasPrimary: Color(0xFF000000),
      ),
    );
    LEThemeData actualThemeData;

    await tester.pumpWidget(
      LEApp(
        theme: themeData,
        home: Builder(
          builder: (BuildContext context) {
            actualThemeData = LETheme.of(context);
            return const Placeholder();
          },
        ),
      ),
    );
    expect(actualThemeData, themeData);
  });

  testWidgets('Hero animation works', (WidgetTester tester) async {
    await tester.pumpWidget(
      LEApp(
        home: ListView(
          children: <Widget>[
            Hero(
              tag: 'Hero',
              child: Text('Text'),
            ),
            Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      LEPageRoute<void>(
                        builder: (BuildContext context) {
                          return Hero(
                            tag: 'Hero',
                            child: Text('Text'),
                          );
                        },
                      ),
                    );
                  },
                  child: Text('Animate'),
                );
              },
            ),
          ],
        ),
      ),
    );
    await tester.tap(find.text('Animate'));
    await tester.pump();
    await tester.pump(Duration(milliseconds: 100));
    // During the hero transition, the hero widget is lifted off of both
    // page route and exists as its own overlay on top of both routes.
    expect(find.widgetWithText(LEPageRoute, 'Text'), findsNothing);
    expect(find.widgetWithText(Navigator, 'Text'), findsOneWidget);
  });
}
