import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_editor.dart';
import 'package:toastification/toastification.dart';

class CustomEditBlogViewForm extends StatefulWidget {
  const CustomEditBlogViewForm(
      {super.key, this.blogImages, required this.blog});
  final List<File>? blogImages;
  final Blog blog;
  @override
  State<CustomEditBlogViewForm> createState() => _CustomEditBlogViewFormState();
}

class _CustomEditBlogViewFormState extends State<CustomEditBlogViewForm> {
  String? newTitle, newContent;
  List<String> newSelectedTopics = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      widget.blogImages == null) {
                    showToast('You don\'t have change any thing!', context);
                  } else {
                    context.read<BlogBloc>().add(UpdateBlogEvent(
                        image: widget.blogImages,
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
    );
  }
}
