import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

import '../painting/image_data.dart';

Widget _buildFolder({
  String identifier = '',
  List<ImageProvider> identifierAvatars,
}) {
  return LEApp(
    home: Center(
      child: LEFolder(
        identifier: identifier,
        identifierAvatars: identifierAvatars,
      ),
    ),
  );
}

void main() {
  testWidgets('Identifier parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildFolder(
        identifier: 'Test',
      ),
    );
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('IdentifierAvatars parameter', (WidgetTester tester) async {
    List<ImageProvider> identifierAvatars = [
      MemoryImage(Uint8List.fromList(kTransparentImage)),
      MemoryImage(Uint8List.fromList(kTransparentImage)),
    ];

    await tester.pumpWidget(
      _buildFolder(
        identifierAvatars: identifierAvatars,
      ),
    );
    expect(find.byType(LEAvatar), findsNWidgets(2));
  });

  testWidgets('Height value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildFolder(),
    );
    expect(
        find.byWidgetPredicate(
            (Widget widget) => widget is SizedBox && widget.height == 40.0),
        findsOneWidget);
  });

  testWidgets('Padding value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildFolder(),
    );
    Padding padding = tester.widget<Padding>(find.byType(Padding));
    expect(
        padding.padding,
        EdgeInsets.only(
          left: 16.0,
          top: 10.0,
          right: 16.0,
        ));
  });

  testWidgets('SpacerBetweenAvatar value', (WidgetTester tester) async {
    List<ImageProvider> identifierAvatars = [
      MemoryImage(Uint8List.fromList(kTransparentImage)),
      MemoryImage(Uint8List.fromList(kTransparentImage)),
      MemoryImage(Uint8List.fromList(kTransparentImage)),
    ];

    await tester.pumpWidget(
      _buildFolder(
        identifierAvatars: identifierAvatars,
      ),
    );
    expect(
        find.byWidgetPredicate(
            (Widget widget) => widget is SizedBox && widget.width == 2.0),
        findsNWidgets(2));
  });

  testWidgets('BackgroundColor value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildFolder(),
    );
    expect(
        find.byWidgetPredicate((Widget widget) =>
            widget is LEMaterial && widget.color == LEStyle().canvasPrimary),
        findsOneWidget);
  });

  testWidgets('IdentifierTextStyle value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildFolder(
        identifier: 'Test',
      ),
    );
    Text text = tester.widget<Text>(find.text('Test'));
    expect(
        text.style,
        LETypography().head.apply(
              color: LEStyle().contentHeavy,
            ));
  });
}
