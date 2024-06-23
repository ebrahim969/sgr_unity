import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/utils/pick_image.dart';
import 'package:sgr_unity/features/blog/presentation/sections/edit_blog_view_form.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_image_update_view.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_types_widget.dart';

class EditBlogView extends StatefulWidget {
  const EditBlogView({super.key, required this.blog});
  final Blog blog;

  @override
  State<EditBlogView> createState() => _EditBlogViewState();
}

class _EditBlogViewState extends State<EditBlogView> {
  List<File>? blogImages;
  void selectImage() async {
    final pickedImage = await pickMultiImages();
    if (pickedImage != null) {
      setState(() {
        blogImages = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 32.h,
              ),
              blogImagesUpdateView(
                  blog: widget.blog,
                  selectImage: selectImage,
                  blogImages: blogImages),
              SizedBox(
                height: 16.h,
              ),
              CustomBlogTypesListWidget(selectedType: widget.blog.topics),
              SizedBox(
                height: 8.h,
              ),
              CustomEditBlogViewForm(blog: widget.blog)
            ],
          ),
        ),
      ),
    );
  }
}
