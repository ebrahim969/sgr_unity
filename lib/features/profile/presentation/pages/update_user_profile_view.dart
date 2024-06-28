import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/services/service_locator.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:sgr_unity/features/profile/presentation/sections/custom_update_user_profile_body.dart';

class UpdateUserProfileView extends StatelessWidget {
  const UpdateUserProfileView({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider.value(
        value: sl<ProfileBloc>(),
        child: CustomUpdateUserProfileBody(
          user: user,
        ),
      ),
    );
  }
}
