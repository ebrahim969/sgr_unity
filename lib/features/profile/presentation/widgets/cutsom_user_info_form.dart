import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_form_feild.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:toastification/toastification.dart';

class CustomUserInfoForm extends StatefulWidget {
  const CustomUserInfoForm({super.key, required this.user, this.profilePic});
  final UserEntity user;
  final File? profilePic;

  @override
  State<CustomUserInfoForm> createState() => _CustomUserInfoFormState();
}

class _CustomUserInfoFormState extends State<CustomUserInfoForm> {
  String? name;
  String? shortBio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextFormFeild(
          hintText: 'Name',
          controller: TextEditingController(text: widget.user.name),
          onChanged: (value) {
            name = value;
          },
          maxLength: 16,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomAuthTextFormFeild(
          hintText: 'Short Bio',
          controller: TextEditingController(text: widget.user.shortBio),
          onChanged: (value) {
            shortBio = value;
          },
          maxLines: 3,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomAuthTextFormFeild(
          hintText: 'email',
          controller: TextEditingController(text: widget.user.email),
          enabled: false,
        ),
        SizedBox(
          height: 16.h,
        ),
        BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is UpdateUserFailure) {
              showToast(state.errMessage, context);
            } else if (state is UpdateUserSuccess) {
              showToast('Your profile updated successfully', context,
                  type: ToastificationType.success);
              custompopNavigate(context);
            }
          },
          builder: (context, state) {
            return CustomAuthBtn(
                isLoading: state is UpdateUserLoading,
                buttonText: 'Update',
                onPressed: () {
                  if (widget.profilePic == null &&
                      name == null &&
                      shortBio == null) {
                    showToast("You don't have change anything!", context,
                        type: ToastificationType.error);
                  }
                  context.read<ProfileBloc>().add(UpdateUserDataEvent(
                      id: widget.user.id,
                      name: name ?? widget.user.name,
                      email: widget.user.email,
                      image: widget.profilePic,
                      shortBio: shortBio ?? widget.user.shortBio));
                });
          },
        ),
      ],
    );
  }
}
