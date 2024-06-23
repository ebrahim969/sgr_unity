import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFancyShimmerImage extends StatelessWidget {
  const CustomFancyShimmerImage({
    super.key,
    this.image,
    this.index, this.images, this.height, this.width,
  });

  final List<String>? images;
  final String? image;
  final int? index;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      height: height?? 300.h,
      width: width?? 300.h,
      imageUrl: image ?? images![index??0],
      shimmerBaseColor: Colors.grey.shade300,
      shimmerHighlightColor: Colors.grey.shade100,
      boxFit: BoxFit.cover,
      boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      errorWidget: const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }
}
