import 'dart:ui';

import 'package:flutter/material.dart';

class GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;
  final double blur;

  const GlowOrb({
    super.key,
    required this.size,
    required this.color,
    required this.opacity,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: blur,
        sigmaY: blur,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: opacity),
        ),
      ),
    );
  }
}