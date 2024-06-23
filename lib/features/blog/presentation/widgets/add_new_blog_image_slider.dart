import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/utils/custom_fancy_shimmer_image.dart';

class AddNewBlogImagesSlider extends StatelessWidget {
  const AddNewBlogImagesSlider({
    super.key,
    this.image,
    this.index,
    required this.selectImage,
    this.isFile = false,
    this.imageUrl,
  });

  final List<File>? image;
  final int? index;
  final void Function() selectImage;
  final bool isFile;
  final List<String>? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectImage,
      child: SizedBox(
          height: 150.h,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: isFile
                ? Image.file(
                    image![index ?? 0],
                    fit: BoxFit.cover,
                  )
                : imageUrl != null
                    ? CustomFancyShimmerImage(image: imageUrl![index ?? 0])
                    : null,
          )),
    );
  }
}
