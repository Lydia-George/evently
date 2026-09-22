import 'package:flutter/material.dart';

class SplashFadeInUp extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double beginOffset;

  const SplashFadeInUp({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
    this.beginOffset = 20,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(
        begin: 0,
        end: 1,
      ),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(
              0,
              beginOffset * (1 - value),
            ),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}