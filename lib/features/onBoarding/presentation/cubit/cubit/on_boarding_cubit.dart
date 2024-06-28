import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/images.dart';
import 'package:sgr_unity/features/onBoarding/data/model/on_boarding_model.dart';
import 'package:sgr_unity/features/onBoarding/presentation/widgets/on_boarding_widget.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  int currentPage = 0;
  int nextPage = 0;
  final controller = LiquidController();
  final List<Widget> pages = [
    OnBoardingWidget(
      color: AppPallete.gradient2,
      model: OnBoardingModel(
        imagePath: Assets.imagesOnBoarding,
        title:
            "Discover insightful blogs and stay updated with the latest trends in surveying, remote sensing, and GIS.",
      ),
    ),
    OnBoardingWidget(
      color: AppPallete.borderDarkColor,
      model: OnBoardingModel(
          imagePath: Assets.imagesOnBoarding2,
          title:
              "Connect with professionals and enthusiasts, and engage in meaningful discussions on your favorite topics."),
    ),
    OnBoardingWidget(
      color: AppPallete.gradient3,
      model: OnBoardingModel(
          imagePath: Assets.imagesOnBoarding3,
          title:
              "Easily find, read, and follow blogs that matter to you, all in one place."),
    ),
  ];

  void onPageChangeCallback(int activeIndex) {
    currentPage = activeIndex;
    emit(OnBoardingCounter());
  }

  void animateToPage() {
    nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  skip() => controller.jumpToPage(page: 2);
}
