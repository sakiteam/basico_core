import 'package:basico_core/basico_core.dart';
import 'package:flutter/material.dart';

enum CustomButtonType {
  flat,
  elevated,
  outlined,
}

class CustomButton extends StatelessWidget {
  final CustomButtonType type;
  final Widget? child;
  final String? label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final bool loading;
  final OutlinedBorder? shape;
  final IconData? icon;
  final double? iconSize;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? iconWidget;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key,
    this.type = CustomButtonType.elevated,
    this.child,
    this.label,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.loading = false,
    this.shape,
    this.icon,
    this.iconSize,
    this.labelStyle,
    this.padding,
    this.iconWidget,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final finalChild = loading
        ? const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : (child ??
            Row(
              spacing: normalSpacing,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconWidget != null) iconWidget!,
                if (icon != null)
                  Icon(
                    icon,
                    size: iconSize,
                  ),
                (label == null
                    ? const SizedBox()
                    : Text(
                        label!.toUpperCase(),
                        style: labelStyle ??
                            const TextStyle(
                              fontSize: 13,
                            ),
                      ))
              ],
            ));

    final finalOnPressed = loading ? null : onPressed;

    final finalShape = shape ??
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(height ?? 50),
        );

    switch (type) {
      case CustomButtonType.flat:
        return SizedBox(
          width: width,
          height: height,
          child: TextButton(
            onPressed: finalOnPressed,
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: finalShape,
              padding: padding,
            ),
            child: finalChild,
          ),
        );
      case CustomButtonType.outlined:
        return SizedBox(
          width: width,
          height: height,
          child: OutlinedButton(
            onPressed: finalOnPressed,
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.white,
              foregroundColor:
                  foregroundColor ?? Theme.of(context).primaryColor,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              side: BorderSide(
                width: 0.25,
                color: foregroundColor ?? Theme.of(context).primaryColor,
              ),
              shape: finalShape,
              padding: padding,
            ),
            child: finalChild,
          ),
        );
      case CustomButtonType.elevated:
        return SizedBox(
          width: width,
          height: height,
          child: ElevatedButton(
            onPressed: finalOnPressed,
            style: TextButton.styleFrom(
              backgroundColor:
                  backgroundColor ?? Theme.of(context).primaryColor,
              foregroundColor: foregroundColor ?? Colors.white,
              disabledBackgroundColor: Colors.grey.shade300,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: finalShape,
              elevation: 0,
              padding: padding,
            ),
            child: finalChild,
          ),
        );
    }
  }
}
