import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_blogs/get_any_user_blogs_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_info/get_any_user_info_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/sections/cutsom_any_user_profile_to_section.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_any_user_profile_blogs.dart';

class AnyUserProfileView extends StatelessWidget {
  const AnyUserProfileView({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  BlocProvider.value(
                    value: sl<GetAnyUserInfoBloc>(),
                    child: CustomAnyUserProfileTopSection(
                      userId: blog.posterId,
                    ),
                  ),
                  BlocProvider.value(
                    value: sl<GetAnyUserBlogsBloc>(),
                    child: CustomAnyUserProfileBlogs(
                      userId: blog.posterId,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
