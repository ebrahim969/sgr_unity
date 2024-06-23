import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_user_update_image.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    super.key,
    required this.selectImage,
    this.image,
    this.userImage,
  });
  final void Function() selectImage;
  final File? image;
  final String? userImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: userImage != null && image == null
          ? CustomUserUpdateImage(
              userImage: userImage, selectImage: selectImage)
          : Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                  image: image != null
                      ? DecorationImage(
                          image: FileImage(image!), fit: BoxFit.cover)
                      : null,
                  shape: BoxShape.circle),
              child: Center(
                  child: image == null ? const Icon(Icons.person) : null),
            ),
    );
  }
}
