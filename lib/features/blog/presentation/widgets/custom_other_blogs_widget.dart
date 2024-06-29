import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/sections/blogs_from_same_auther.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomOtherBlogsWidget extends StatelessWidget {
  const CustomOtherBlogsWidget({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(
                text: S.of(context).OtherBlogsFrom, style: TextStyle(fontSize: 20.sp)),
            TextSpan(
                text: blog.posterName,
                style: TextStyle(fontSize: 20.sp, color: AppPallete.gradient1))
          ]),
        ),
        SizedBox(
            width: 70.w,
            child: const Divider(
              thickness: 3,
              color: AppPallete.gradient3,
            )),
        SizedBox(
          height: 16.h,
        ),
        BlogsFromSameAuther(
          blog: blog,
        )
      ],
    );
  }
}
