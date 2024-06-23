import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sgr_unity/features/blog/presentation/sections/custom_blog_images_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/add_new_blog_image_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_select_image_dotted_border.dart';

class CustomSelectBlogImageWidget extends StatelessWidget {
  const CustomSelectBlogImageWidget({
    super.key,
    required this.selectImage,
    this.image,
  });
  final void Function() selectImage;
  final List<File>? image;
  @override
  Widget build(BuildContext context) {
    return image != null
        ? image!.length == 1
            ? AddNewBlogImagesSlider(
                image: image,
                selectImage: selectImage,
                isFile: true,
              )
            : CustomBlogImagesSlider(
                selectImage: selectImage,
                image: image,
                isFile: true,
              )
        : CustomSelectImagesDottedBorder(selectImage: selectImage);
  }
}
