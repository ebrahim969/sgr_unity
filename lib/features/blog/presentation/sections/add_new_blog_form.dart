import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_editor.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_types_widget.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_select_blog_image_widget.dart';
import 'package:sgr_unity/generated/l10n.dart';

class AddNewBlogForm extends StatefulWidget {
  const AddNewBlogForm({
    super.key,
    required this.titleController,
    required this.contentController,
    this.blogImage,
    required this.selectedType,
    required this.selectImage,
    required this.txt,
  });

  final TextEditingController titleController;
  final TextEditingController contentController;
  final List<File>? blogImage;
  final List<String> selectedType;
  final void Function() selectImage;
  final S txt;
  @override
  State<AddNewBlogForm> createState() => _AddNewBlogFormState();
}

class _AddNewBlogFormState extends State<AddNewBlogForm> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            CustomSelectBlogImageWidget(
              selectImage: widget.selectImage,
              image: widget.blogImage,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomBlogTypesListWidget(
              txt: widget.txt,
              selectedType: widget.selectedType,
            ),
            SizedBox(
              height: 8.h,
            ),
            BlogEditor(
                controller: widget.titleController,
                hintText: widget.txt.BlogTitle),
            SizedBox(
              height: 8.h,
            ),
            BlogEditor(
                controller: widget.contentController,
                hintText: widget.txt.BlogContent)
          ],
        ),
      ),
    );
  }
}
