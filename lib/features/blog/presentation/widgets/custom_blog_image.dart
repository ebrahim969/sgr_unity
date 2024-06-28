import 'package:flutter/material.dart';
import 'package:sgr_unity/core/utils/widgets/custom_fancy_shimmer_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/full_screen_blog_image_view.dart';

class CustomBlogImage extends StatelessWidget {
  const CustomBlogImage({
    super.key,
    this.height,
    this.width,
    this.index,
    required this.image,
    this.isEdit = false,
    this.selectImage,
  });
  final void Function()? selectImage;
  final int? index;
  final List<String> image;
  final double? height;
  final double? width;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEdit
          ? selectImage
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FullScreenBlogImageView(image: image),
                ),
              );
            },
      child: CustomFancyShimmerImage(images: image, index: index, height: height,width: width,),
    );
  }
}
