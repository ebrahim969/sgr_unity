import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/blog_details_widget.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_other_blogs_widget.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_saved_blogs_widget.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_share_blog_widget.dart';
import 'package:sgr_unity/generated/l10n.dart';
import 'package:toastification/toastification.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key, required this.blog});
  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                showToast(
                                    S.of(context).Thisfeaturewillbeaddedsoon,
                                    context, type: ToastificationType.info);
                              },
                              child: const Icon(Icons.recommend)),
                          CustomShareBlogWidget(blog: blog),
                          CustomSavedBlogWidget(blog: blog)
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Divider(
                          thickness: 3,
                          color: AppPallete.gradient2,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomOtherBlogsWidget(blog: blog),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
