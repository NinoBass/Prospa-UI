import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prospa_assessment/src/presentation/resources/res.dart';

class TextFieldUi extends StatefulWidget {
  const TextFieldUi({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.onChanged,
    this.decoration,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.inputFormatter,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.done,
    this.autofocus = false,
    this.autovalidateMode,
    this.enabled = true,
    this.autofillHints,
    this.onEditingComplete,
    this.initialValue,
  });

  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final FormFieldValidator<String?>? validator;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final InputDecoration? decoration;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final Iterable<String>? autofillHints;

  @override
  State<TextFieldUi> createState() => _TextFieldUiState();
}

class _TextFieldUiState extends State<TextFieldUi> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        TextEditingController(
          text: widget.initialValue,
        );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      autofillHints: widget.enabled ? widget.autofillHints : null,
      enabled: widget.enabled,
      validator: widget.validator,
      cursorColor: brandSecondary,
      cursorWidth: 1.r,
      cursorHeight: 18.spMin,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      obscuringCharacter: '●',
      maxLines: widget.maxLines,
      keyboardType: widget.keyboardType,
      autocorrect: false,
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autovalidateMode,
      style: body3.copyWith(
        color: white.withOpacity(widget.enabled ? 1 : .6),
        height: 16.r / 12,
        fontSize: 12,
      ),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        contentPadding: EdgeInsets.zero,
        focusedBorder: regularInputBorder(white),
        focusedErrorBorder: regularInputBorder(white),
        border: regularInputBorder(white),
        enabledBorder: regularInputBorder(white),
        labelStyle: body3.copyWith(
          color: white,
          fontFamily: mediumText,
          height: 16.r / 12,
        ),
        floatingLabelStyle: body3.copyWith(
          color: brandSecondary,
          fontFamily: mediumText,
        ),
        hintText: widget.hintText,
        hintStyle: body3.copyWith(
          color: white.withOpacity(.4),
          fontFamily: mediumText,
          fontSize: 12,
          height: 16.r / 12,
        ),
        constraints: const BoxConstraints(
          minHeight: 44,
        ).r,
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 44,
          maxHeight: 44,
        ).r,
      ),
    );
  }
}

UnderlineInputBorder regularInputBorder(
  Color color,
) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: 1.r,
    ),
  );
}
