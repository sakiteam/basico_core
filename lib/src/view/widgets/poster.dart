import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../logic/utils/spacing_utils.dart';

class Poster extends StatelessWidget {
  final String? title;
  final String? description;
  final IconData? icon;
  final String? image;
  final EdgeInsets? padding;
  final Widget? content;
  final bool expandContent;
  final bool safeAreaTop;
  final bool safeAreaLeft;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final bool expandDescription;
  final bool expandImage;
  final bool expandIcon;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final bool contentAutomaticPadding;

  const Poster({
    super.key,
    this.title,
    this.description,
    this.icon,
    this.image,
    this.padding,
    this.content,
    this.expandContent = false,
    this.safeAreaTop = true,
    this.safeAreaLeft = true,
    this.safeAreaRight = true,
    this.safeAreaBottom = true,
    this.expandDescription = false,
    this.expandImage = false,
    this.expandIcon = false,
    this.titleStyle,
    this.descriptionStyle,
    this.contentAutomaticPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconContent = icon == null
        ? null
        : Expanded(
            flex: expandIcon ? 1 : 0,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor.withAlpha(25),
                  // border: Border.all(
                  //   color: Theme.of(context).primaryColor,
                  // ),
                ),
                child: Icon(
                  icon,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          );
    final imageContent = image == null
        ? null
        : Expanded(
            flex: expandImage ? 1 : 0,
            child: Center(
              child: SizedBox(height: 200, child: SvgPicture.asset(image!)),
            ),
          );
    final titleContent = title == null
        ? null
        : Text(
            title!,
            textAlign: TextAlign.center,
            style:
                titleStyle ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          );
    final descriptionContent = description == null
        ? null
        : Expanded(
            flex: expandDescription ? 1 : 0,
            child: Center(
              child: Text(
                description!,
                textAlign: TextAlign.center,
                style:
                    descriptionStyle ??
                    const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          );
    final contentContent = content == null
        ? null
        : Expanded(flex: expandContent ? 1 : 0, child: content!);

    if (contentContent == null || contentAutomaticPadding) {
      return SafeArea(
        top: safeAreaTop,
        left: safeAreaLeft,
        right: safeAreaRight,
        bottom: safeAreaBottom,
        minimum: padding ?? EdgeInsets.all(regularSpacing),
        child: Column(
          spacing: regularSpacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ?iconContent,
            ?imageContent,
            ?titleContent,
            ?descriptionContent,
            ?contentContent,
          ],
        ),
      );
    } else {
      final pHorizontal = EdgeInsets.only(
        left: padding?.left ?? regularSpacing,
        right: padding?.right ?? regularSpacing,
      );

      return SafeArea(
        top: safeAreaTop,
        left: false,
        right: false,
        bottom: safeAreaBottom,
        minimum: (padding ?? EdgeInsets.all(regularSpacing)).copyWith(
          left: 0,
          right: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: regularSpacing,
          children: [
            Padding(
              padding: pHorizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: regularSpacing,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ?iconContent,
                  ?imageContent,
                  ?titleContent,
                  ?descriptionContent,
                ],
              ),
            ),
            contentContent,
          ],
        ),
      );
    }
  }
}

class PosterTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;

  const PosterTitle(this.title, {super.key, this.style, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style:
          style ?? const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
