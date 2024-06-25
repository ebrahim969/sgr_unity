import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/core/utils/pick_image.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_editor.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_image_update_view.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_types_widget.dart';
import 'package:toastification/toastification.dart';

class EditBlogView extends StatefulWidget {
  const EditBlogView({super.key, required this.blog});
  final Blog blog;

  @override
  State<EditBlogView> createState() => _EditBlogViewState();
}

class _EditBlogViewState extends State<EditBlogView> {
  List<File>? blogImages;
    String? newTitle, newContent;
  List<String> newSelectedTopics = [];
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
              BlogEditor(
            onChanged: (title) {
              newTitle = title;
            },
            controller: TextEditingController(text: widget.blog.title),
            hintText: 'Title'),
        SizedBox(
          height: 8.h,
        ),
        BlogEditor(
            onChanged: (content) {
              newContent = content;
            },
            controller: TextEditingController(text: widget.blog.content),
            hintText: 'Content'),
        SizedBox(
          height: 16.h,
        ),
        BlocConsumer<BlogBloc, BlogState>(
          listener: (context, state) {
            if (state is UpdateBlogSuccess) {
              showToast('Blog updated successfuly', context,
                  type: ToastificationType.success);
              custompopNavigate(context);
            } else if (state is BlogFailure) {
              showToast(state.message, context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomAuthBtn(
                buttonText: 'Update',
                onPressed: () {
                  if (newTitle == null &&
                      newContent == null &&
                      blogImages == null) {
                    showToast('You don\'t have change any thing!', context);
                  } else {
                    context.read<BlogBloc>().add(UpdateBlogEvent(
                        image: blogImages,
                        title: newTitle ?? widget.blog.title,
                        content: newContent ?? widget.blog.content,
                        blogId: widget.blog.id,
                        posterId: widget.blog.posterId,
                        topics: widget.blog.topics,
                        updatedAt: DateTime.now()));
                  }
                },
                isLoading: state is BlogLoading,
              ),
            );
          },
        ),
            ],
          ),
        ),
      ),
    );
  }
}
