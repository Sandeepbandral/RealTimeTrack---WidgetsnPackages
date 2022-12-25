import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class RttTextField extends StatelessWidget {
  const RttTextField({
    Key? key,
    this.hintText,
    this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.filled = true,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.maxLines = 1,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool filled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final OutlineInputBorder? border;
  final VoidCallback? onTap;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(
              left: Dimension.d2,
              bottom: Dimension.d2,
            ),
            child: Text(labelText ?? '', style: textTheme.titleSmall),
          ),
        TextFormField(
          style: textTheme.titleMedium?.copyWith(fontSize: 18),
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          obscuringCharacter: '*',
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hintText,
            filled: filled,
            fillColor: Colors.white,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorStyle: textTheme.errorStyle,
            hintStyle: textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade400,
            ),
            contentPadding: const EdgeInsets.all(Dimension.d4),
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: outlineInputBorder.borderSide.width,
              ),
            ),
            errorBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(
                color: Colors.red,
                width: outlineInputBorder.borderSide.width,
              ),
            ),
            focusedErrorBorder: outlineInputBorder.copyWith(
              borderSide: BorderSide(
                color: Colors.red,
                width: outlineInputBorder.borderSide.width,
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder get outlineInputBorder {
    return border ??
        OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimension.d3),
        );
  }
}
