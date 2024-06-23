import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';

class CustomSelectImagesDottedBorder extends StatelessWidget {
  const CustomSelectImagesDottedBorder({
    super.key,
    required this.selectImage,
  });

  final void Function() selectImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectImage();
      },
      child: DottedBorder(
          color: AppPallete.gradient2,
          dashPattern: const [20, 4],
          radius: const Radius.circular(16),
          borderType: BorderType.RRect,
          strokeCap: StrokeCap.round,
          child: SizedBox(
            height: 150.h,
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.folder_open_rounded,
                  size: 32,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Select your image',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
