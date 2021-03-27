import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

Widget _buildRoundButton({
  Color color = const Color(0xFF000000),
  Color iconColor = const Color(0xFF000000),
  IconData icon = LEIcons.bell_outline,
  GestureTapCallback onTap,
}) {
  return LEApp(
    home: Center(
      child: LERoundButton(
        color: color,
        iconColor: iconColor,
        icon: icon,
        onTap: onTap ?? () {},
      ),
    ),
  );
}

void main() {
  testWidgets('OnPressed event', (WidgetTester tester) async {
    bool value = false;

    await tester.pumpWidget(
      _buildRoundButton(
        onTap: () {
          value = true;
        },
      ),
    );

    expect(value, isFalse);
    await tester.tap(find.byType(LERoundButton));
    expect(value, isTrue);
  });

  testWidgets('Color parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildRoundButton(
        color: Color(0xFF000000),
      ),
    );
    LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
    expect(material.color, Color(0xFF000000));
  });

  testWidgets('IconColor parameter / IconSize value',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildRoundButton(
        iconColor: Color(0xFF000000),
      ),
    );
    LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
    expect(
        material.iconThemeData,
        IconThemeData(
          color: Color(0xFF000000),
          size: 24.0,
        ));
  });

  testWidgets('Icon parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildRoundButton(
        icon: LEIcons.at_outline,
      ),
    );
    expect(find.byIcon(LEIcons.at_outline), findsOneWidget);
  });

  testWidgets('Size value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildRoundButton(),
    );
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is SizedBox &&
            widget.width == 40.0 &&
            widget.height == 40.0),
        findsOneWidget);
  });
}
