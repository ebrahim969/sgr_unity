import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/sections/blogs_from_same_auther.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_details_widget.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Scrollbar(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlogDetailsWidget(
                        blog: blog,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Other Blogs From ',
                              style: TextStyle(fontSize: 20.sp)),
                          TextSpan(
                              text: blog.posterName,
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppPallete.gradient1))
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
