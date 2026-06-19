import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? child;
  final double? leadingWidth;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool divider;
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.child,
    this.leadingWidth,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.divider = false,
    this.titleWidget,
    this.subtitleWidget,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          leadingWidth: leadingWidth,
          leading: leading,
          actions: actions,
          centerTitle: true,
          toolbarHeight: height,
          title:
              child ??
              Column(
                children: [
                  if (title != null && titleWidget == null) Text(title!),
                  ?titleWidget,
                  if (subtitle != null && subtitleWidget == null)
                    Text(
                      subtitle!,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ?subtitleWidget,
                ],
              ),
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          bottom: bottom,
        ),
        if (divider)
          Positioned(bottom: 0, left: 0, right: 0, child: const Divider()),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
