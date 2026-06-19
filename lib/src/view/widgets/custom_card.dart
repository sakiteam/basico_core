import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final EdgeInsets? padding;
  final double elevation;
  final Border? border;
  final BoxConstraints? constraints;

  const CustomCard({
    super.key,
    this.width,
    this.height,
    this.margin,
    this.child,
    this.color,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.padding,
    this.elevation = 0,
    this.border,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Container(
        height: height,
        width: width,
        constraints: constraints,
        child: Material(
          elevation: elevation,
          clipBehavior: Clip.antiAlias,
          color: color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
            side: borderWidth == 0
                ? BorderSide.none
                : BorderSide(
                    color: borderColor ?? Colors.grey.shade400,
                    width: borderWidth ?? 0.5,
                  ),
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ),
    );
  }
}
