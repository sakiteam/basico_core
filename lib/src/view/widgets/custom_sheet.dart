import 'package:flutter/material.dart';

class CustomSheet extends StatefulWidget {
  final double? height;
  final Widget? child;
  final double? maxHeight;
  final bool dismissible;
  final bool enableHandleBackgroundColor;

  const CustomSheet({
    super.key,
    this.child,
    this.height,
    this.maxHeight,
    this.dismissible = true,
    this.enableHandleBackgroundColor = true,
  });

  @override
  State<CustomSheet> createState() => _CustomSheetState();
}

class _CustomSheetState extends State<CustomSheet> {
  bool _isScrolledUnder = false;

  void _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification ||
        notification is ScrollEndNotification) {
      final scrolledUnder = notification.metrics.pixels > 0;
      if (scrolledUnder != _isScrolledUnder) {
        setState(() {
          _isScrolledUnder = scrolledUnder;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewInsetsBottom = MediaQuery.of(context).viewInsets.bottom;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    const double handleHeight = 16;

    // Couleur du handle : gris par défaut, ou surfaceTint quand scrollé
    final handleColor =
        // _isScrolledUnder
        //     ? colorScheme.surfaceTint.withOpacity(0.12)
        //     :
        Colors.grey.shade500;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.dismissible
                ? () {
                    Navigator.of(context).maybePop();
                  }
                : null,
          ),
        ),
        Container(
          width: double.infinity,
          height: widget.height == null
              ? null
              : (widget.height! - viewInsetsBottom),
          constraints: BoxConstraints(
            maxHeight: widget.maxHeight ?? double.infinity,
          ),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Material(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _handleScrollNotification(notification);
                return false;
              },
              child: Column(
                children: [
                  Material(
                    color:
                        _isScrolledUnder && widget.enableHandleBackgroundColor
                            ? colorScheme.surfaceContainer
                            : null,
                    elevation:
                        _isScrolledUnder && widget.enableHandleBackgroundColor
                            ? 3
                            : 0,
                    surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                    child: Container(
                      height: handleHeight,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: handleColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  if (widget.child != null)
                    Expanded(
                      flex: widget.height == null ? 0 : 1,
                      child: widget.child!,
                    ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: viewInsetsBottom,
        ),
      ],
    );
  }
}
