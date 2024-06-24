import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/add_new_blog_image_slider.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/custom_blog_image.dart';
import 'package:sgr_unity/features/blog/presentation/widgets/slider_indecator.dart';

class CustomBlogImagesSlider extends StatefulWidget {
  const CustomBlogImagesSlider({
    super.key,
    this.isFile = false,
    this.imageUrl,
    this.image,
    this.selectImage, this.isEdit,
  });

  final List<File>? image;
  final List<String>? imageUrl;
  final bool isFile;
  final void Function()? selectImage;
  final bool? isEdit;
  @override
  State<CustomBlogImagesSlider> createState() => _CustomBlogImagesSliderState();
}

class _CustomBlogImagesSliderState extends State<CustomBlogImagesSlider> {
  int activeIndex = 0;
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          itemCount:
              widget.isFile ? widget.image?.length : widget.imageUrl!.length,
          itemBuilder: (context, index, realIndex) {
            return widget.isFile
                ? AddNewBlogImagesSlider(
                    selectImage: widget.selectImage!,
                    image: widget.image,
                    index: index,
                    isFile: true,
                  )
                : CustomBlogImage(
                  isEdit: widget.isEdit?? false,
                    selectImage: widget.selectImage,
                    image: widget.imageUrl ?? [],
                    index: index,
                  );
          },
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        sliderIndecator(
            activeIndex, widget.isFile ? widget.image : widget.imageUrl),
      ],
    );
  }
}
