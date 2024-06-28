import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_fancy_shimmer_image.dart';

class CustomUserUpdateImage extends StatelessWidget {
  const CustomUserUpdateImage({
    super.key,
    required this.userImage,
    required this.selectImage,
  });

  final String? userImage;
  final void Function() selectImage;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        child: CustomFancyShimmerImage(
          image: userImage,
          height: 80,
          width: 80,
        ),
      ),
      Positioned(
          bottom: 1,
          right: -10,
          child: GestureDetector(
            onTap: selectImage,
            child: const CircleAvatar(
              backgroundColor: AppPallete.gradient2,
              radius: 15,
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 15,
                ),
              ),
            ),
          ))
    ]);
  }
}
