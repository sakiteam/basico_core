import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'custom_card.dart';

class SelectorData<T> {
  final String name;
  final T value;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? backgroundColorSelected;
  final Color? foregroundColorSelected;

  const SelectorData({
    required this.name,
    required this.value,
    this.backgroundColor,
    this.foregroundColor,
    this.backgroundColorSelected,
    this.foregroundColorSelected,
  });
}

enum CustomSelectorDisplayType {
  row,
  grid,
}

double get h => kIsWeb ? 48 : 56;

class CustomSelector<T> extends StatefulWidget {
  final List<SelectorData<T>> data;
  final T? value;
  final void Function(T) onChanged;
  final CustomSelectorDisplayType displayType;
  final IconData? selectionIcon;
  final double? borderWidth;

  const CustomSelector({
    super.key,
    required this.data,
    required this.value,
    required this.onChanged,
    this.displayType = CustomSelectorDisplayType.row,
    this.selectionIcon,
    this.borderWidth,
  });

  @override
  State<CustomSelector<T>> createState() => _CustomSelectorState<T>();
}

class _CustomSelectorState<T> extends State<CustomSelector<T>> {
  final AutoSizeGroup _autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final rows = (widget.data.length / 2).ceil();

    return CustomCard(
      borderWidth: widget.borderWidth,
      height:
          widget.displayType == CustomSelectorDisplayType.grid ? (rows * h) : h,
      child: widget.displayType == CustomSelectorDisplayType.row
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final e in widget.data) ...[
                  Expanded(
                    child: SelectorOption(
                      autoSizeGroup: _autoSizeGroup,
                      data: e,
                      onChanged: widget.onChanged,
                      selectedValue: widget.value,
                      selectionIcon: widget.selectionIcon,
                    ),
                  ),
                  if (e != widget.data.last) const VerticalDivider(width: 1),
                ]
              ],
            )
          : LayoutBuilder(builder: (context, constraints) {
              return GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                childAspectRatio: (constraints.maxWidth / 2) / 56,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  for (int i = 0; i < widget.data.length; i++) ...[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (i.isOdd) const VerticalDivider(width: 0.125),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: SelectorOption(
                                  autoSizeGroup: _autoSizeGroup,
                                  data: widget.data[i],
                                  onChanged: widget.onChanged,
                                  selectedValue: widget.value,
                                  selectionIcon: widget.selectionIcon,
                                ),
                              ),
                              if (i < (rows - 1) * 2) const Divider(),
                            ],
                          ),
                        ),
                        if (i.isEven) const VerticalDivider(width: 0.125),
                      ],
                    ),
                  ]
                ],
              );
            }),
    );
  }
}

class SelectorOption<T> extends StatelessWidget {
  final AutoSizeGroup autoSizeGroup;
  final SelectorData<T> data;
  final void Function(T) onChanged;
  final T? selectedValue;
  final IconData? selectionIcon;

  const SelectorOption({
    super.key,
    required this.autoSizeGroup,
    required this.data,
    required this.onChanged,
    required this.selectedValue,
    this.selectionIcon,
  });

  @override
  Widget build(BuildContext context) {
    final selected = data.value == selectedValue;

    return Material(
      color: selected
          ? (data.backgroundColorSelected ??
              Theme.of(context).primaryColor.withAlpha(50))
          : (data.backgroundColor ?? Colors.white),
      child: InkWell(
        onTap: () => onChanged(data.value),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: selectionIcon != null && selected
                ? Icon(
                    selectionIcon,
                    color: data.foregroundColorSelected,
                  )
                : AutoSizeText(
                    group: autoSizeGroup,
                    textAlign: TextAlign.center,
                    // maxLines: 1,
                    minFontSize: 5,
                    data.name.toUpperCase(),
                    style: TextStyle(
                      color: selected
                          ? data.foregroundColorSelected
                          : data.foregroundColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
