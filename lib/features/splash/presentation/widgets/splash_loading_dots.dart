import 'dart:math' as math;

import 'package:flutter/material.dart';

class SplashLoadingDots extends StatefulWidget {
  const SplashLoadingDots({super.key});

  @override
  State<SplashLoadingDots> createState() => _SplashLoadingDotsState();
}

class _SplashLoadingDotsState extends State<SplashLoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    )
      ..repeat();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot({
    required double phase,
    required Color color,
  }) {
    return AnimatedBuilder(animation: _controller, builder: (context, child) {
      final bounce =
      math.sin((_controller.value * 2 * math.pi) + phase);

      return Transform.translate(offset: Offset(0, -4 * bounce),
        child: child,
      );
    },
      child: Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
        _buildDot(phase: 0, color: Color(0xFFA855F7)),
    SizedBox(width: 6,),
    _buildDot(phase: 1, color: Color(0xFFC084FC)),
    SizedBox(width: 6,),
    _buildDot(phase: 2,color: const Color(0xFFD8B4FE)),
    ]
    );
  }
}
