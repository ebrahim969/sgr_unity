import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/onBoarding/presentation/cubit/cubit/on_boarding_cubit.dart';
import 'package:sgr_unity/features/onBoarding/presentation/widgets/custom_on_boarding_indecator.dart';
import 'package:sgr_unity/features/onBoarding/presentation/widgets/custom_onBoarding_btn.dart';
import 'package:sgr_unity/generated/l10n.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardingCounter) {
          onBoardingCubit.currentPage + 1;
        }
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              onPageChangeCallback: onBoardingCubit.onPageChangeCallback,
              liquidController: onBoardingCubit.controller,
              pages: onBoardingCubit.pages,
              enableLoop: false,
            ),
            Positioned(
                top: 25,
                right: 5,
                child: TextButton(
                  onPressed: () {
                    onBoardingCubit.skip();
                  },
                  child: Text(
                    S.of(context).Skip,
                    style: TextStyle(
                        color: AppPallete.whiteColor, fontSize: 16.sp),
                  ),
                )),
            Positioned(
                bottom: 60,
                child: CustomOnBoardingButton(cubit: onBoardingCubit)),
            Positioned(
                bottom: 10,
                child: CustomSmoothIndecator(onBoardingCubit: onBoardingCubit)),
          ],
        );
      },
    );
  }
}
