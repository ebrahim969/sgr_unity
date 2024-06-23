import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget sliderIndecator(var activeIndex, List<dynamic>? images) {
  return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images!.length,
      effect: const SlideEffect(
          dotColor: AppPallete.borderColor,
          activeDotColor: AppPallete.gradient3));
}
