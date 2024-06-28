import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sgr_unity/generated/l10n.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.folder_open_rounded,
                  size: 32,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  S.of(context).Selectyourimage,
                  style: const TextStyle(fontSize: 14),
                )
              ],
            ),
          )),
    );
  }
}
