import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/utils/pick_image.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_user_avatar.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/cutsom_user_info_form.dart';

class CustomUpdateUserProfileBody extends StatefulWidget {
  const CustomUpdateUserProfileBody({super.key, required this.user});
  final UserEntity user;

  @override
  State<CustomUpdateUserProfileBody> createState() =>
      _CustomUpdateUserProfileBodyState();
}

class _CustomUpdateUserProfileBodyState
    extends State<CustomUpdateUserProfileBody> {
  String? name;
  String? shortBio;
  File? profilePic;
  void selectProfileAvatar() async {
    final image = await pickImage();
    if (image != null) {
      setState(() {
        profilePic = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CustomUserAvatar(
              userImage: widget.user.profileAvatar,
              selectImage: selectProfileAvatar,
              image: profilePic,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomUserInfoForm(
              user: widget.user,
              profilePic: profilePic,
            ),
          ],
        ),
      ),
    );
  }
}
