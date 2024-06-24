import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_signout.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';
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
              child: RefreshIndicator(
                color: AppPallete.gradient1,
                onRefresh: () async {
                  context
                      .read<GetCurrentUserBloc>()
                      .add(GetCurrentUserDataEvent());    
                },
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
            ),
          ],
        ));
  }
}
