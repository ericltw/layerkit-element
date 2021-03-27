import 'package:flutter_test/flutter_test.dart';

import 'package:layerkit/layerkit.dart';

Widget _buildLabel({
  LabelSize size = LabelSize.small,
  Color color = const Color(0xFF000000),
  Color textColor = const Color(0xFF000000),
  String text = '',
}) {
  return LEApp(
    home: Center(
      child: LELabel(
        size: size,
        color: color,
        textColor: textColor,
        text: text,
      ),
    ),
  );
}

void main() {
  group('Size: small', () {
    testWidgets('Color parameter', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.small,
          color: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(material.color, Color(0xFF000000));
    });

    testWidgets('TextColor parameter / TextStyle value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.small,
          textColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.textStyle,
          LETypography().overline1.apply(
                color: Color(0xFF000000),
              ));
    });

    testWidgets('Text parameter', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.small,
          text: 'Test',
        ),
      );
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('BorderRadius value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.small,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(material.borderRadius, BorderRadius.circular(32.0));
    });

    testWidgets('Padding value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.small,
        ),
      );
      Padding padding = tester.widget<Padding>(find.byType(Padding));
      expect(
          padding.padding,
          EdgeInsets.symmetric(
            horizontal: 6.0,
            vertical: 2.0,
          ));
    });
  });

  group('Size: medium', () {
    testWidgets('Color parameter', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.medium,
          color: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(material.color, Color(0xFF000000));
    });

    testWidgets('TextColor parameter / TextStyle value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.medium,
          textColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.textStyle,
          LETypography().overline1.apply(
                color: Color(0xFF000000),
              ));
    });

    testWidgets('Text parameter', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.medium,
          text: 'Test',
        ),
      );
      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('BorderRadius value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.medium,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(material.borderRadius, BorderRadius.circular(32.0));
    });

    testWidgets('Padding value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildLabel(
          size: LabelSize.medium,
        ),
      );
      Padding padding = tester.widget<Padding>(find.byType(Padding));
      expect(
          padding.padding,
          EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 6.0,
          ));
    });
  });
}
