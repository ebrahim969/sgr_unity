import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_loader.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/core/utils/widgets/pick_image.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/sections/add_new_blog_form.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

class AddNewBlogView extends StatefulWidget {
  const AddNewBlogView({super.key});

  @override
  State<AddNewBlogView> createState() => _AddNewBlogViewState();
}

class _AddNewBlogViewState extends State<AddNewBlogView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<File>? blogImage;
  List<String> selectedType = [];
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  void selectImage() async {
    final pickedImage = await pickMultiImages();
    if (pickedImage != null) {
      setState(() {
        blogImage = pickedImage;
      });
    }
  }

  void uploadBlogMethod() {
    if (formKey.currentState!.validate() && selectedType.isNotEmpty) {
      final posterId =
          (context.read<GetCurrentUserBloc>().state as GetUserSuccess).user.id;
      context.read<BlogBloc>().add(UploadBlogEvent(
          blogImage,
          titleController.text.trim(),
          contentController.text.trim(),
          posterId,
          selectedType));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
        title: const Text('Add new blog'),
        centerTitle: true,
        actions: [
          BlocConsumer<BlogBloc, BlogState>(
            listener: (context, state) {
              if (state is BlogFailure) {
                showToast(state.message, context);
              } else if (state is UnitBlogSuccess) {
                customReplacementNavigate(context, '/MainScreenView');
              }
            },
            builder: (context, state) {
              return state is BlogLoading
                  ? const CustomLoader()
                  : IconButton(
                      onPressed: () {
                        uploadBlogMethod();
                      },
                      icon: const Icon(
                        Icons.done,
                        color: AppPallete.gradient3,
                      ));
            },
          )
        ],
      ),
      body: Form(
          key: formKey,
          child: AddNewBlogForm(
            titleController: titleController,
            contentController: contentController,
            selectedType: selectedType,
            selectImage: selectImage,
            blogImage: blogImage,
          )),
    );
  }
}
