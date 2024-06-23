import 'package:flutter/material.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/onBoarding/presentation/cubit/cubit/on_boarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothIndecator extends StatelessWidget {
  const CustomSmoothIndecator({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: onBoardingCubit.currentPage,
      count: onBoardingCubit.pages.length,
      effect:
          const WormEffect(activeDotColor: AppPallete.whiteColor, dotHeight: 5),
    );
  }
}
