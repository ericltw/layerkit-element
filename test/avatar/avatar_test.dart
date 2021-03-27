import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:layerkit/layerkit.dart';

import '../painting/image_data.dart';

Widget _buildAvatar({
  AvatarSize size = AvatarSize.small,
  ImageProvider image,
  Color borderColor,
  Color statusIndicatorColor,
}) {
  return LEApp(
    home: Center(
      child: LEAvatar(
        size: size,
        image: image ??
            MemoryImage(
              Uint8List.fromList(kTransparentImage),
            ),
        borderColor: borderColor,
        statusIndicatorColor: statusIndicatorColor,
      ),
    ),
  );
}

main() {
  group('Size: xsmall', () {
    testWidgets('Image parameter', (WidgetTester tester) async {
      ImageProvider image = MemoryImage(
        Uint8List.fromList(kTransparentImage),
      );

      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xsmall,
          image: image,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      DecorationImage decorationImage = material.image;
      expect(decorationImage.image, image);
    });

    testWidgets('BorderColor parameter / BorderWidth value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xsmall,
          borderColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.border,
          Border.all(
            color: Color(0xFF000000),
            width: 1.0,
          ));
    });

    testWidgets('Size value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xsmall,
        ),
      );
      SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 16.0);
      expect(sizedBox.height, 16.0);
    });
  });

  group('Size: small', () {
    testWidgets('Image parameter', (WidgetTester tester) async {
      ImageProvider image = MemoryImage(Uint8List.fromList(kTransparentImage));

      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.small,
          image: image,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      DecorationImage decorationImage = material.image;
      expect(decorationImage.image, image);
    });

    testWidgets('BorderColor parameter / BorderWidth value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.small,
          borderColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.border,
          Border.all(
            color: Color(0xFF000000),
            width: 1.0,
          ));
    });

    testWidgets('Size value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.small,
        ),
      );
      SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 20.0);
      expect(sizedBox.height, 20.0);
    });
  });

  group('Size: medium', () {
    testWidgets('Image parameter', (WidgetTester tester) async {
      ImageProvider image = MemoryImage(Uint8List.fromList(kTransparentImage));

      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.medium,
          image: image,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      DecorationImage decorationImage = material.image;
      expect(decorationImage.image, image);
    });

    testWidgets('BorderColor parameter / BorderWidth value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.medium,
          borderColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.border,
          Border.all(
            color: Color(0xFF000000),
            width: 1.0,
          ));
    });

    testWidgets('Size value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.medium,
        ),
      );
      SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 24.0);
      expect(sizedBox.height, 24.0);
    });
  });

  group('Size: large', () {
    testWidgets('Image parameter', (WidgetTester tester) async {
      ImageProvider image = MemoryImage(Uint8List.fromList(kTransparentImage));

      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.large,
          image: image,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      DecorationImage decorationImage = material.image;
      expect(decorationImage.image, image);
    });

    testWidgets('BorderColor parameter / BorderWidth value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.large,
          borderColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.border,
          Border.all(
            color: Color(0xFF000000),
            width: 2.0,
          ));
    });

    testWidgets('Size value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.large,
        ),
      );
      SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 40.0);
      expect(sizedBox.height, 40.0);
    });
  });

  group('Size: xlarge', () {
    testWidgets('Image parameter', (WidgetTester tester) async {
      ImageProvider image = MemoryImage(Uint8List.fromList(kTransparentImage));

      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xlarge,
          image: image,
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      DecorationImage decorationImage = material.image;
      expect(decorationImage.image, image);
    });

    testWidgets('BorderColor parameter / BorderWidth value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xlarge,
          borderColor: Color(0xFF000000),
        ),
      );
      LEMaterial material = tester.widget<LEMaterial>(find.byType(LEMaterial));
      expect(
          material.border,
          Border.all(
            color: Color(0xFF000000),
            width: 2.0,
          ));
    });

    testWidgets('StatusIndicator parameter', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xlarge,
          statusIndicatorColor: Color(0xFF000000),
        ),
      );
      expect(find.byType(LEStatusIndicator), findsOneWidget);
    });

    testWidgets('Size value', (WidgetTester tester) async {
      await tester.pumpWidget(
        _buildAvatar(
          size: AvatarSize.xlarge,
        ),
      );
      SizedBox sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 48.0);
      expect(sizedBox.height, 48.0);
    });
  });
}
