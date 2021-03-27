import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

Widget _buildDivider() {
  return LEApp(
    home: Center(
      child: LEDivider(),
    ),
  );
}

void main() {
  testWidgets('Height value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildDivider(),
    );
    SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.height, 1.0);
  });

  testWidgets('Color value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildDivider(),
    );
    LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
    expect(material.color, LEStyle().divider);
  });
}
