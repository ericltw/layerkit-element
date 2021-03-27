import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

import '../painting/image_data.dart';

Widget _buildMaterial({
  Color color,
  DecorationImage image,
  BoxBorder border,
  BorderRadius borderRadius,
  List<BoxShadow> boxShadow,
  BoxShape shape = BoxShape.rectangle,
  TextStyle textStyle,
  IconThemeData iconThemeData,
  Widget child = const Placeholder(),
}) {
  return LEApp(
    home: LEMaterial(
      color: color,
      image: image,
      border: border,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
      shape: shape,
      textStyle: textStyle,
      iconThemeData: iconThemeData,
      child: child,
    ),
  );
}

void main() {
  testWidgets('Color parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildMaterial(color: Color(0xFF000000)),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.color, Color(0xFF000000));
  });

  testWidgets('Image parameter', (WidgetTester tester) async {
    DecorationImage image = DecorationImage(
      image: MemoryImage(
        Uint8List.fromList(kTransparentImage),
      ),
    );

    await tester.pumpWidget(
      _buildMaterial(
        image: image,
      ),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.image, image);
  });

  testWidgets('Border parameter', (WidgetTester tester) async {
    Border border = Border();

    await tester.pumpWidget(
      _buildMaterial(
        border: border,
      ),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.border, border);
  });

  testWidgets('BorderRadius parameter', (WidgetTester tester) async {
    BorderRadius borderRadius = BorderRadius.zero;

    await tester.pumpWidget(
      _buildMaterial(
        borderRadius: borderRadius,
      ),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.borderRadius, borderRadius);
  });

  testWidgets('BoxShadow parameter', (WidgetTester tester) async {
    List<BoxShadow> boxShadow = [
      BoxShadow(),
    ];

    await tester.pumpWidget(
      _buildMaterial(
        boxShadow: boxShadow,
      ),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.boxShadow, boxShadow);
  });

  testWidgets('Shape parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildMaterial(
        shape: BoxShape.circle,
      ),
    );
    DecoratedBox decoratedBox =
        tester.widget<DecoratedBox>(find.byType(DecoratedBox));
    BoxDecoration decoration = decoratedBox.decoration;
    expect(decoration.shape, BoxShape.circle);
  });

  testWidgets('TextStyle parameter', (WidgetTester tester) async {
    TextStyle textStyle = TextStyle();

    await tester.pumpWidget(
      _buildMaterial(
        textStyle: textStyle,
      ),
    );
    DefaultTextStyle defaultTextStyle =
        tester.widget<DefaultTextStyle>(find.byType(DefaultTextStyle).at(1));
    expect(defaultTextStyle.style, textStyle);
  });

  testWidgets('IconThemeData parameter', (WidgetTester tester) async {
    IconThemeData iconThemeData = IconThemeData();

    await tester.pumpWidget(
      _buildMaterial(
        iconThemeData: iconThemeData,
      ),
    );
    IconTheme iconTheme = tester.widget<IconTheme>(find.byType(IconTheme));
    expect(iconTheme.data, iconThemeData);
  });

  testWidgets('Child parameter', (WidgetTester tester) async {
    Widget child = Placeholder();

    await tester.pumpWidget(
      _buildMaterial(
        child: child,
      ),
    );
    expect(find.byType(Placeholder), findsOneWidget);
  });
}
