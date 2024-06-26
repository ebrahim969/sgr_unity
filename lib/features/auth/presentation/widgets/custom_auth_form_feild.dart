import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomAuthTextFormFeild extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;
  final void Function(String)? onChanged;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final String? helperText;
  const CustomAuthTextFormFeild({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    this.onChanged,
    this.enabled = true,
    this.maxLength,
    this.maxLines,
    this.helperText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppPallete.gradient3,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(hintText: hintText, helperText: helperText),
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing!";
        }
        return null;
      },
      obscureText: isObscureText,
      enabled: enabled,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
    );
  }
}
