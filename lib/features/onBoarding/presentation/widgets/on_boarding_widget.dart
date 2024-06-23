import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sgr_unity/features/onBoarding/data/model/on_boarding_model.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.model,
    required this.color,
  });

  final OnBoardingModel model;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24.h,
            ),
            SvgPicture.asset(
              model.imagePath,
              height: 200.h,
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              model.title,
              style: TextStyle(fontSize: 24.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
