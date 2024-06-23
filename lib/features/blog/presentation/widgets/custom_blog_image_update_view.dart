import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/presentation/sections/custom_blog_images_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/add_new_blog_image_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_select_image_dotted_border.dart';

Widget blogImagesUpdateView(
    {required Blog blog,
    List<File>? blogImages,
    required VoidCallback selectImage}) {
  return blogImages != null
      ? blogImages.length == 1
          ? AddNewBlogImagesSlider(
              selectImage: selectImage,
              image: blogImages,
              isFile: true,
            )
          : CustomBlogImagesSlider(
              selectImage: selectImage,
              image: blogImages,
              isFile: true,
            )
      : blog.imageUrl!.isEmpty && blogImages == null
          ? CustomSelectImagesDottedBorder(selectImage: selectImage)
          : blog.imageUrl!.length == 1 && blogImages == null
              ? AddNewBlogImagesSlider(
                  selectImage: selectImage,
                  imageUrl: blog.imageUrl,
                )
              : CustomBlogImagesSlider(
                  selectImage: selectImage,
                  imageUrl: blog.imageUrl,
                );
}
