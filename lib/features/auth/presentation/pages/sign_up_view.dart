import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/background_circles_widget.dart';
import 'package:sgr_unity/features/auth/presentation/sections/custom_sign_up_form.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/join_to_unity_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCirclesWidget(
            radius: 100,
            color: AppPallete.gradient1,
            top: -20,
            left: -40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 115.h,
                  ),
                ),
                const SliverToBoxAdapter(
                    child: JoinToUnityWidget(
                  txt: 'Join to ',
                )),
                const SliverToBoxAdapter(
                  child: CustomSignUpForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
