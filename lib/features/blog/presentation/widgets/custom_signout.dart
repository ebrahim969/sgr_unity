import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/custom_loader.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';

BlocConsumer<AuthBloc, AuthState> customSignOut() {
  return BlocConsumer<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is UnitSuccess) {
        customReplacementNavigate(context, '/');
      } else if (state is AuthFailure) {
        showToast(state.message, context);
      }
    },
    builder: (context, state) {
      return state is AuthLoading
          ? const CustomLoader()
          : IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthUserSignOut());
              },
              icon: const Icon(Icons.logout_outlined));
    },
  );
}
