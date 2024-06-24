import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/core/utils/assets/images.dart';
import 'package:sgr_unity/core/utils/custom_loader.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool onBoardingVisited =
        sl<CacheHelper>().getData(key: 'OnBoardingVisited') ?? false;
    bool isUserLoggedIn =
        sl<CacheHelper>().getData(key: 'UserLoggedIn') ?? false;
    if (onBoardingVisited == true) {
      if (isUserLoggedIn == true) {
        context.read<GetCurrentUserBloc>().add(GetCurrentUserDataEvent());
      } else {
        delayedNavigate(context, '/SignInView');
      }
    } else {
      delayedNavigate(context, '/OnBoardingView');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCurrentUserBloc, GetUsersState>(
      listener: (context, state) {
        if (state is GetUserSuccess) {
          customReplacementNavigate(context, '/MainScreenView');
        } else if (state is GetUserFailure) {
          showToast(state.errMessage, context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(Assets.imagesSGRUnityIcon, height: 100,)),
                SizedBox(
                  height: 48.h,
                ),
                state is GetUserLoading
                    ? const CustomLoader()
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}
