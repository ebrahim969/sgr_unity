import 'package:go_router/go_router.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/presentation/pages/sign_in_view.dart';
import 'package:sgr_unity/features/auth/presentation/pages/sign_up_view.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/presentation/pages/add_new_blog_view.dart';
import 'package:sgr_unity/features/blog/presentation/pages/blog_details_view.dart';
import 'package:sgr_unity/features/blog/presentation/pages/edit_blog_view.dart';
import 'package:sgr_unity/features/onBoarding/presentation/page/on_boarding_view.dart';
import 'package:sgr_unity/features/profile/presentation/pages/any_user_profile_view.dart';
import 'package:sgr_unity/features/profile/presentation/pages/update_user_profile_view.dart';
import 'package:sgr_unity/features/splash/presentation/page/splash_view.dart';
import 'package:sgr_unity/main_screen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const SplashView()),
    GoRoute(path: "/OnBoardingView", builder: (context, state) => const OnBoardingView()),
    GoRoute(
        path: "/SignInView", builder: (context, state) => const SignInView()),
    GoRoute(
        path: "/SignUpView", builder: (context, state) => const SignUpView()),
    GoRoute(
        path: "/AddNewBlogView",
        builder: (context, state) => const AddNewBlogView()),
    GoRoute(
        path: "/MainScreenView",
        builder: (context, state) => const MainScreenView()),
    GoRoute(
        path: "/BlogDetailsView",
        builder: (context, state) => BlogDetailsView(
              blog: state.extra as Blog,
            )),
    GoRoute(
        path: "/UpdateUserProfileView",
        builder: (context, state) => UpdateUserProfileView(
              user: state.extra as UserEntity,
            )),
    GoRoute(
        path: "/EditBlogView",
        builder: (context, state) => EditBlogView(
              blog: state.extra as Blog,
            )),
    GoRoute(
        path: "/AnyUserProfileView",
        builder: (context, state) => AnyUserProfileView(
              blog: state.extra as Blog,
            )),
  ],
);
