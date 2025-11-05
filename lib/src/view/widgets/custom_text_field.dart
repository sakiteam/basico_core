import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_label.dart';

final double _defaultBorderRadiusValue = 16;

class CustomTextField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? hint;
  final TextInputType? keyboardType;
  final void Function(String value)? onChanged;
  final bool clear;
  final String? initialValue;
  final TextEditingController? controller;
  final String? label;
  final TextCapitalization textCapitalization;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final BorderRadius? borderRadius;
  final double? borderWidth;
  final bool autofocus;
  final Color? backgroundColor;
  final bool readOnly;
  final void Function()? onPressed;
  final bool isRequired;
  final String? helpTitle;
  final String? helpDescription;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final InputDecoration? decoration;
  final InputBorder? border;
  final bool displayLabelOnBottom;
  final TextStyle? style;

  const CustomTextField({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.hint,
    this.keyboardType,
    this.onChanged,
    this.clear = false,
    this.initialValue,
    this.controller,
    this.label,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.borderRadius,
    this.borderWidth,
    this.autofocus = false,
    this.backgroundColor,
    this.readOnly = false,
    this.onPressed,
    this.isRequired = false,
    this.helpTitle,
    this.helpDescription,
    this.contentPadding,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.border,
    this.decoration,
    this.displayLabelOnBottom = false,
    this.style,
  });

  static final defaultborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_defaultBorderRadiusValue),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 0.5,
    ),
  );

  static final defaultDecoration = InputDecoration(
    // contentPadding: widget.contentPadding,
    border: defaultborder,
    enabledBorder: defaultborder,
    focusedBorder: defaultborder.copyWith(borderSide: BorderSide(width: 2)),
    // hintText: widget.hint,
    hintStyle: const TextStyle(color: Colors.grey),
    filled: true,
    fillColor: Colors.white,
  );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ??
        TextEditingController(
          text: widget.initialValue,
        );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = widget.border ??
        OutlineInputBorder(
          borderRadius: widget.borderRadius ??
              BorderRadius.circular(_defaultBorderRadiusValue),
          borderSide: widget.borderWidth == 0
              ? BorderSide.none
              : BorderSide(
                  color: Colors.grey,
                  width: widget.borderWidth ?? 0.5,
                ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null && !widget.displayLabelOnBottom)
          CustomLabel(
            widget.label!,
            isRequired: widget.isRequired,
            helpTitle: widget.helpTitle,
            helpDescription: widget.helpDescription,
          ),
        TextFormField(
          style: widget.style,
          focusNode: widget.focusNode,
          // key: widget.globalKey,

          onFieldSubmitted: widget.onFieldSubmitted,
          autovalidateMode: widget.autovalidateMode,
          validator: widget.isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champ est obligatoire !";
                  }

                  return widget.validator?.call(value);
                }
              : widget.validator,
          onTap: widget.onPressed,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          controller: _controller,
          inputFormatters: widget.inputFormatters,
          buildCounter: (context,
                  {required currentLength,
                  required isFocused,
                  required maxLength}) =>
              null,
          keyboardType: widget.keyboardType,
          textCapitalization: widget.textCapitalization,
          decoration: widget.decoration ??
              InputDecoration(
                contentPadding: widget.contentPadding,
                border: border,
                enabledBorder: border,
                focusedBorder: border.copyWith(
                  borderSide: BorderSide(
                    width: widget.borderWidth ?? 2,
                  ),
                ),
                hintText: widget.hint,
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: widget.backgroundColor ?? Colors.white,
                prefix: widget.prefix,
                prefixIcon: widget.prefixIcon,
                labelText: widget.displayLabelOnBottom ? widget.label : null,
                suffixIcon: widget.suffixIcon ??
                    (widget.clear && _controller.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _controller.clear();
                              widget.onChanged?.call("");
                            },
                            icon: const Icon(Icons.clear))
                        : null),
                suffix: widget.suffix,
              ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
