import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:real_time_track_package/real_time_track_package.dart';

class RttTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool filled;
  final Color? fillColor;
  final Color? hintColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final OutlineInputBorder? border;
  final VoidCallback? onTap;
  final int? maxLines;
  final double? maxHeight;
  final double? fontSize;

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
    this.fillColor,
    this.hintColor,
    this.inputFormatters,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.onTap,
    this.border,
    this.maxLines = 1,
    this.maxHeight,
    this.fontSize,
  }) : super(key: key);

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
        if (maxHeight != null) ...[
          Container(
            constraints:
                BoxConstraints(maxHeight: maxHeight ?? double.infinity),
            child: _buildTextField(
              textTheme: textTheme,
              colorScheme: colorScheme,
            ),
          )
        ] else ...[
          _buildTextField(
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
        ],
      ],
    );
  }

  Widget _buildTextField(
      {required TextTheme textTheme, required ColorScheme colorScheme}) {
    return TextFormField(
      autocorrect: false,
      autofocus: false,
      style: textTheme.titleMedium?.copyWith(fontSize: fontSize ?? 18),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscuringCharacter: '*',
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        filled: filled,
        fillColor: fillColor ?? Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorStyle: textTheme.errorStyle,
        hintStyle: textTheme.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: hintColor ?? Colors.grey.shade400,
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
