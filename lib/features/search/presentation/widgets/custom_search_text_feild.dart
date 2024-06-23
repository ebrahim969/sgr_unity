import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChanged});

  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppPallete.gradient3,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 8.h),
        hintText: 'what are you looking for',
        prefixIcon: const Icon(Icons.search_outlined),
        border: InputBorder.none,
      ),
    );
  }
}
