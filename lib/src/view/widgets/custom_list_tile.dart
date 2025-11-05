import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final IconData? icon;
  final Color? iconBackgroundColor;
  final Color? iconForegroundColor;
  final void Function()? onPressed;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool? dense;
  final EdgeInsets? contentPadding;
  final double? minVerticalPadding;
  final double? minTileHeight;

  const CustomListTile({
    super.key,
    this.title,
    this.subtitle,
    this.onPressed,
    this.trailing,
    this.icon,
    this.leading,
    this.iconBackgroundColor,
    this.iconForegroundColor,
    this.titleStyle,
    this.subtitleStyle,
    this.dense,
    this.contentPadding,
    this.minVerticalPadding,
    this.minTileHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: dense,
      contentPadding:
          contentPadding ?? const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: minVerticalPadding,
      minTileHeight: minTileHeight,
      title: title == null
          ? null
          : Text(
              title!,
              style: titleStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: subtitleStyle ??
                  const TextStyle(
                    color: Colors.grey,
                  ),
            ),
      trailing: trailing ?? const Icon(Icons.keyboard_arrow_right),
      leading: leading ??
          (icon == null
              ? null
              : CircleAvatar(
                  backgroundColor: iconBackgroundColor ?? Colors.transparent,
                  foregroundColor: iconForegroundColor ?? Colors.black,
                  child: Icon(icon),
                )),
      onTap: onPressed,
    );
  }
}
