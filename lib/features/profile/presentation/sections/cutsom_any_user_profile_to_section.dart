import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/utils/custom_loader.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_any_user_info/get_any_user_info_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/sections/custom_user_info_section.dart';

class CustomAnyUserProfileTopSection extends StatefulWidget {
  const CustomAnyUserProfileTopSection({super.key, required this.userId});
  final String userId;
  @override
  State<CustomAnyUserProfileTopSection> createState() =>
      _CustomAnyUserProfileTopSectionState();
}

class _CustomAnyUserProfileTopSectionState
    extends State<CustomAnyUserProfileTopSection> {
  @override
  void initState() {
    context.read<GetAnyUserInfoBloc>().add(EventGetAnyUserInfo(widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAnyUserInfoBloc, GetAnyUserInfoState>(
      builder: (context, state) {
        if (state is GetAnyUserInfoSuccess) {
          return CustomUserInformationsSection(
            isCurrentUser: false,
            user: state.user,
          );
        } else if (state is GetAnyUserInfoLoading) {
          return const Center(child: CustomLoader());
        } else {
          return const Center(child: CustomLoader());
        }
      },
    );
  }
}
