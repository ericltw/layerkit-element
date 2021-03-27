import 'package:flutter/widgets.dart';

class LEMaterial extends StatelessWidget {
  const LEMaterial({
    Key key,
    this.color,
    this.image,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.shape = BoxShape.rectangle,
    this.textStyle,
    this.iconThemeData,
    this.child,
  })  : assert(!(identical(shape, BoxShape.circle) && borderRadius != null)),
        super(key: key);

  final Color color;

  final DecorationImage image;

  final BoxBorder border;

  final BorderRadius borderRadius;

  final List<BoxShadow> boxShadow;

  final BoxShape shape;

  final TextStyle textStyle;

  final IconThemeData iconThemeData;

  final Widget child;

  Widget _buildMaterial() {
    if (textStyle == null && iconThemeData == null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          shape: shape,
        ),
        child: child,
      );
    }
    if (textStyle != null && iconThemeData == null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          shape: shape,
        ),
        child: DefaultTextStyle(
          style: textStyle,
          child: child,
        ),
      );
    }
    if (textStyle == null && iconThemeData != null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          image: image,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          shape: shape,
        ),
        child: IconTheme(
          data: iconThemeData,
          child: child,
        ),
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        shape: shape,
      ),
      child: DefaultTextStyle(
        style: textStyle,
        child: IconTheme(
          data: iconThemeData,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildMaterial();
  }
}
