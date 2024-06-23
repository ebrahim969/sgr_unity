import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_signout.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_profile_blogs.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_profile_info_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            customSignOut(),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomProfileInfoWidget(),
                    SizedBox(
                      height: 16.h,
                    ),
                    const CustomProfileBlogs(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
