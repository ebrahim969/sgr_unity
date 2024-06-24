import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/sections/custom_user_info_section.dart';
import 'package:sgr_unity/features/profile/presentation/widgets/custom_user_information_loading.dart';

class CustomProfileInfoWidget extends StatefulWidget {
  const CustomProfileInfoWidget({super.key});

  @override
  State<CustomProfileInfoWidget> createState() =>
      _CustomProfileInfoWidgetState();
}

class _CustomProfileInfoWidgetState extends State<CustomProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentUserBloc, GetUsersState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return CustomUserInformationsSection(
            isCurrentUser: true,
            user: state.user,
          );
        } else if (state is GetUserLoading) {
          return const CustomUserInformationLoading();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}