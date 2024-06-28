import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/onBoarding/data/function/on_boarding_visited.dart';
import 'package:sgr_unity/features/onBoarding/presentation/cubit/cubit/on_boarding_cubit.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomOnBoardingButton extends StatelessWidget {
  const CustomOnBoardingButton({
    super.key,
    required this.cubit,
  });

  final OnBoardingCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (cubit.currentPage == 2) {
          customReplacementNavigate(context, '/SignInView');
          onBoardingVisited();
        } else {
          cubit.animateToPage();
        }
      },
      child: AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          duration: const Duration(milliseconds: 1000),
          height: 50.h,
          width: cubit.currentPage == 2 ? 150.w : 60.w,
          decoration: BoxDecoration(
              borderRadius: cubit.currentPage == 2
                  ? const BorderRadius.all(Radius.circular(24))
                  : BorderRadius.circular(24),
              color: AppPallete.gradient1,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 3, offset: Offset(1, 4))
              ]),
          child: cubit.currentPage == 2
              ? Center(
                  child: Text(
                    S.of(context).Jointoourunity,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : Icon(
                  Icons.keyboard_arrow_right,
                  color: AppPallete.whiteColor,
                  size: 40.dg,
                )),
    );
  }
}
