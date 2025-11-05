import 'package:flutter/material.dart';

class Disability extends StatelessWidget {
  final bool condition;
  final Widget child;
  final double? opacity;

  const Disability({
    super.key,
    this.condition = true,
    required this.child,
    this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return AbsorbPointer(
        child: Opacity(
          opacity: condition ? (opacity ?? 0.5) : 1,
          child: child,
        ),
      );
    }

    return child;
  }
}
