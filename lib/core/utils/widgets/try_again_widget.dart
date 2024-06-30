import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/generated/l10n.dart';

class TryAgainWidget extends StatelessWidget {
  const TryAgainWidget({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(S.of(context).Somethingwentwrong),
        SizedBox(
          height: 16.h,
        ),
        GestureDetector(
          onTap: onTap,
          child: Chip(
            label: Text(S.of(context).Tryagain),
            side: const BorderSide(color: AppPallete.borderDarkColor),
          ),
        ),
      ],
    );
  }
}
