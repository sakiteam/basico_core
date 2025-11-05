import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomBar extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const BottomBar({
    super.key,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).colorScheme.surfaceContainer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            alignment: Alignment.center,
            child: SafeArea(
              top: false,
              bottom: false,
              child: child ?? const SizedBox(),
            ),
          ),
          Gap(
            MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}
