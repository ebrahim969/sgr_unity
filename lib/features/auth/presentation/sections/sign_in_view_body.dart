import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/features/auth/presentation/sections/custom_sign_in_form.dart';
import 'package:sgr_unity/core/utils/widgets/background_circles_widget.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/join_to_unity_widget.dart';
import 'package:sgr_unity/generated/l10n.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundCirclesWidget(
          radius: 100,
          top: -20,
          right: -40,
          color: AppPallete.gradient2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 150.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: JoinToUnityWidget(
                txt: S.of(context).Welcometo,
              )),
              const SliverToBoxAdapter(
                child: CustomSignInForm(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
