import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_loading_item.dart';
import 'package:shimmer/shimmer.dart';

class CustomUserInformationLoading extends StatelessWidget {
  const CustomUserInformationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppPallete.greyColor,
      highlightColor: Colors.grey.shade100,
      period: const Duration(milliseconds: 500),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppPallete.whiteColor,
                ),
                SizedBox(
                  width: 12,
                ),
                CustomLoadingItem(height: 20, width: 90),
                SizedBox(
                  width: 8,
                ),
                CustomLoadingItem(height: 20, width: 90)
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomLoadingItem(height: 20, width: 150),
                CustomLoadingItem(height: 35, width: 100),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CustomLoadingItem(height: 10, width: 100)
          ],
        ),
      ),
    );
  }
}
