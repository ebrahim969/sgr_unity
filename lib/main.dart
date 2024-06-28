import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/core/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:sgr_unity/core/theme/enum/app_theme_enum.dart';
import 'package:sgr_unity/features/app/sgr_unity.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/blog_bloc/blog_bloc.dart';
import 'package:sgr_unity/features/blog/presentation/blocs/user_saved_blogs/user_saved_blogs_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_blogs/get_any_user_blogs_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => sl<GetCurrentUserBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<GetAnyUserBlogsBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<AuthBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<BlogBloc>(),
      ),
      BlocProvider(
        create: (context) => sl<UserSavedBlogsBloc>(),
      ),
      BlocProvider(create: (context) => AppThemeCubit()..changeAppTheme(AppThemeEnum.initial))
    ],
    child: const SGRBlogs(),
  ));
}
