import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:sgr_unity/core/theme/enum/app_theme_enum.dart';
import 'package:sgr_unity/core/utils/widgets/custom_dialog.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';

class CustomProfileMenuWidget extends StatelessWidget {
  const CustomProfileMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: const Icon(
            Icons.menu,
          ),
          color: state is AppThemeDarkMode
              ? AppPallete.darkBackgroundColor
              : AppPallete.lightBackgroundColor,
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Change theme',
              child: Text(
                'Change theme',
              ),
            ),
            const PopupMenuItem(
              value: 'Change Language',
              child: Text(
                'Change Language',
              ),
            ),
            const PopupMenuItem(
                value: 'SignOut',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      'SignOut',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )),
          ],
          onSelected: (value) {
            if (value == 'Change theme') {
              customDialog(
                  context: context,
                  desc: 'Cahnge your app theme',
                  okText: 'Dark',
                  okTap: () {
                    context
                        .read<AppThemeCubit>()
                        .changeAppTheme(AppThemeEnum.dark);
                  },
                  cancleText: 'Light',
                  cancleTap: () {
                    context
                        .read<AppThemeCubit>()
                        .changeAppTheme(AppThemeEnum.light);
                  });
            } else if (value == 'SignOut') {
              context.read<AuthBloc>().add(AuthUserSignOut());
            }
          },
        );
      },
    );
  }
}
