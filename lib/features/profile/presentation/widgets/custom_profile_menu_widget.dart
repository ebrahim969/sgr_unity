import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/theme/app_theme_cubit/app_theme_cubit.dart';
import 'package:sgr_unity/core/theme/enum/app_theme_enum.dart';
import 'package:sgr_unity/core/utils/widgets/custom_dialog.dart';
import 'package:sgr_unity/features/app/cubit/change_language_cubit.dart';
import 'package:sgr_unity/features/app/enum/app_language_enum.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomProfileMenuWidget extends StatelessWidget {
  const CustomProfileMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final txt = S.of(context);
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return PopupMenuButton(
          icon: const Icon(
            Icons.menu,
          ),
          color: state is AppThemeLightMode
              ? AppPallete.lightBackgroundColor
              : AppPallete.darkBackgroundColor,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'Change theme',
              child: Text(
                txt.Changetheme,
              ),
            ),
            PopupMenuItem(
              value: 'Change Language',
              child: Text(
                txt.ChangeLanguage,
              ),
            ),
            PopupMenuItem(
                value: 'SignOut',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    Text(
                      txt.SignOut,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                )),
          ],
          onSelected: (value) {
            if (value == 'Change theme') {
              changeThemeDialog(context, txt);
            } else if (value == 'SignOut') {
              context.read<AuthBloc>().add(AuthUserSignOut());
            } else if (value == 'Change Language') {
              changeLanguageDialog(context, txt);
            }
          },
        );
      },
    );
  }

  void changeLanguageDialog(BuildContext context, S txt) {
    return customDialog(
        context: context,
        desc: txt.Changeyourapplanguage,
        okText: txt.Arabic,
        okTap: () {
          context
              .read<ChangeLanguageCubit>()
              .changeAppLanguage(AppLanguageEnum.arabic);
        },
        cancleText: txt.English,
        cancleTap: () {
          context
              .read<ChangeLanguageCubit>()
              .changeAppLanguage(AppLanguageEnum.english);
        });
  }

  void changeThemeDialog(BuildContext context, S txt) {
    return customDialog(
        context: context,
        desc: txt.Cahngeyourapptheme,
        okText: txt.Dark,
        okTap: () {
          context.read<AppThemeCubit>().changeAppTheme(AppThemeEnum.dark);
        },
        cancleText: txt.Light,
        cancleTap: () {
          context.read<AppThemeCubit>().changeAppTheme(AppThemeEnum.light);
        });
  }
}
