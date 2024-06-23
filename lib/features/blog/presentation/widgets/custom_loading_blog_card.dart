import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_loading_item.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingBlogCard extends StatelessWidget {
  const CustomLoadingBlogCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppPallete.greyColor,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.all(16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppPallete.greyColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppPallete.whiteColor,
                ),
                SizedBox(
                  width: 8.w,
                ),
                const CustomLoadingItem(
                  height: 10,
                  width: 70,
                )
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomLoadingItem(
              height: 30.h,
              width: 100.w,
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLoadingItem(height: 10.h, width: 200.w),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomLoadingItem(height: 10.h, width: 80.w)
                  ],
                ),
                const CustomLoadingItem(height: 50, width: 80)
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            const CustomLoadingItem(height: 10, width: 50)
          ],
        ),
      ),
    );
  }
}
