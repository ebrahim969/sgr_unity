import 'package:flutter/material.dart';
import 'package:sgr_unity/core/utils/custom_fancy_shimmer_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/full_screen_blog_image_view.dart';

class CustomBlogImage extends StatelessWidget {
  const CustomBlogImage({
    super.key,
    this.height,
    this.width,
    this.index,
    required this.image,
  });

  final int? index;
  final List<String> image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullScreenBlogImageView(image: image),
          ),
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CustomFancyShimmerImage(images: image, index: index),
        ),
      ),
    );
  }
}
