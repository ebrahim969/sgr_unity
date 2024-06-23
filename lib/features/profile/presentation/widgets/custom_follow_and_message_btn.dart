import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';

class CustomFollowAndMessageBtn extends StatelessWidget {
  const CustomFollowAndMessageBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: const Chip(
            label: Text('Follow'),
            side: BorderSide(color: AppPallete.borderColor),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        GestureDetector(
          onTap: () {},
          child: const Chip(
            label: Icon(Icons.message),
            side: BorderSide(color: AppPallete.borderColor),
          ),
        ),
      ],
    );
  }
}
