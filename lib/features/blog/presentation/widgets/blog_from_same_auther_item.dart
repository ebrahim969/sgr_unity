import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/custom_fancy_shimmer_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_user_info.dart';

class BlogFromSameAutherItem extends StatelessWidget {
  const BlogFromSameAutherItem({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          customNavigate(context, '/BlogDetailsView', extra: blog);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            blog.imageUrl!.isNotEmpty
                ? CustomFancyShimmerImage(
                    height: 150.h,
                    image: blog.imageUrl!.first,
                  )
                : const SizedBox(),
            SizedBox(
              height: 8.h,
            ),
            CustomBlogUserInfo(blog: blog),
            Text(
              blog.title,
              style: TextStyle(fontSize: 22.sp),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8.h,
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
