import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

import '../painting/image_data.dart';

Widget _buildHeader({
  String identifier = '',
  ImageProvider identifierAvatarImage,
}) {
  return LEApp(
    home: Center(
      child: LEHeader(
        identifier: identifier,
        identifierAvatarImage: identifierAvatarImage,
      ),
    ),
  );
}

void main() {
  testWidgets('Identifier parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(
        identifier: 'Test',
      ),
    );
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('IdentifierAvatarImage parameter', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(
        identifierAvatarImage: MemoryImage(
          Uint8List.fromList(kTransparentImage),
        ),
      ),
    );
    expect(find.byType(LEAvatar), findsOneWidget);
  });

  testWidgets('Height value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(),
    );
    SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
    expect(sizedBox.height, 56.0);
  });

  testWidgets('Padding value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(),
    );
    Padding padding = tester.widget<Padding>(find.byType(Padding));
    expect(
        padding.padding,
        EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ));
  });

  testWidgets('BackgroundColor value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(),
    );
    LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
    expect(material.color, LEStyle().canvasPrimary);
  });

  testWidgets('IdentifierTextStyle value', (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildHeader(
        identifier: 'Test',
      ),
    );
    Text text = tester.widget<Text>(find.text('Test'));
    expect(
        text.style,
        LETypography().h1.apply(
              color: LEStyle().contentHeavy,
            ));
  });
}
