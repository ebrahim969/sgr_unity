import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/calculate_reading_time.dart';
import 'package:sgr_unity/core/functions/format_date_time.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_card_topics.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_user_info.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_saved_blogs_widget.dart';

class CustomBlogCard extends StatelessWidget {
  const CustomBlogCard({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, '/BlogDetailsView', extra: blog);
      },
      child: Container(
        margin: const EdgeInsets.all(16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppPallete.greyColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBlogUserInfo(blog: blog),
            CustomBlogCardTopics(topics: blog.topics),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 200.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        blog.title,
                        style: TextStyle(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      Text(
                        blog.content,
                        style: TextStyle(
                            fontSize: 16.sp, color: AppPallete.greyColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                blog.imageUrl!.isNotEmpty
                    ? CustomBlogImage(
                        image: blog.imageUrl!,
                        height: 50.h,
                        width: 70.w,
                      )
                    : SizedBox(
                        height: 50.h,
                        width: 70.w,
                      )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${formatDateTime(blog.updatedAt)} . ${calculateReadingTime(blog.content)} min read',
                  style:
                      TextStyle(fontSize: 14.sp, color: AppPallete.greyColor),
                ),
                Row(
                  children: [
                    const Icon(Icons.share_sharp),
                    SizedBox(
                      width: 16.w,
                    ),
                    CustomSavedBlogWidget(
                      blog: blog,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
