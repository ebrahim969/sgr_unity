import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomLoadingItem extends StatelessWidget {
  const CustomLoadingItem({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppPallete.whiteColor),
    );
  }
}
