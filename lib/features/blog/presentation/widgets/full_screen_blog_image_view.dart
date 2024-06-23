import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sgr_unity/core/functions/navigation.dart';

class FullScreenBlogImageView extends StatelessWidget {
  const FullScreenBlogImageView({
    super.key,
    required this.image,
  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(image[index]),
              initialScale: PhotoViewComputedScale.contained,
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
              heroAttributes: PhotoViewHeroAttributes(tag: image[index]),
            );
          },
          itemCount: image.length,
          loadingBuilder: (context, event) => const Center(
            child: SizedBox(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 30,
          child: IconButton(
              onPressed: () {
                custompopNavigate(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              )),
        ),
      ],
    );
  }
}
