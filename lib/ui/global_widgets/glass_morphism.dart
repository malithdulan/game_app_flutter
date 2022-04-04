import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final double radius;
  final double width;
  final double height;
  final Color color;
  final Widget child;
  const GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.radius,
    this.color = Colors.white,
    required this.child,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur,
          sigmaY: blur,
        ),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            border: Border.all(
              width: 1.5,
              color: color.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
