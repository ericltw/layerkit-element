import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

Widget _buildScaffold({
  Widget body = const Placeholder(),
}) {
  return LEApp(
    home: LEScaffold(
      body: body,
    ),
  );
}

void main() {
  testWidgets('Body parameter', (WidgetTester tester) async {
    Widget body = Placeholder();

    await tester.pumpWidget(
      _buildScaffold(
        body: body,
      ),
    );
    expect(find.byWidget(body), findsOneWidget);
  });

  testWidgets('Background color value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildScaffold(),
    );
    LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
    expect(material.color, LEStyle().canvasPrimary);
  });
}
