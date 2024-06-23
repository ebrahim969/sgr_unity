import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/cache/cache_helper.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
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
        delayedNavigate(context, '/MainScreenView');
      }
    } else {
      delayedNavigate(context, '/OnBoardingView');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SGR Blogs',
          style: TextStyle(color: AppPallete.gradient1, fontSize: 24),
        ),
      ),
    );
  }
}
