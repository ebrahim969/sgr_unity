import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/functions/calculate_reading_time.dart';
import 'package:sgr_unity/core/functions/format_date_time.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/sections/custom_blog_images_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_user_info.dart';

class BlogDetailsWidget extends StatelessWidget {
  const BlogDetailsWidget({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          blog.title,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomBlogUserInfo(blog: blog),
        SizedBox(
          height: 8.h,
        ),
        Text(
          '${formatDateTime(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min read',
          style: TextStyle(fontSize: 14.sp, color: AppPallete.greyColor),
        ),
        SizedBox(
          height: 22.h,
        ),
        blog.imageUrl!.isNotEmpty
            ? Center(
                child: blog.imageUrl!.length == 1
                    ? CustomBlogImage(image: blog.imageUrl!)
                    : CustomBlogImagesSlider(
                        imageUrl: blog.imageUrl,
                      ))
            : const SizedBox(),
        SizedBox(
          height: 16.h,
        ),
        Text(
          blog.content,
          style: TextStyle(height: 2, fontSize: 18.sp),
        ),
        SizedBox(
          height: 12.h,
        ),
        const Divider()
      ],
    );
  }
}
