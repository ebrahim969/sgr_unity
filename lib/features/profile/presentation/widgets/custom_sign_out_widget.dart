import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/utils/widgets/custom_loader.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';

class CustomSignOutWidget extends StatelessWidget {
  const CustomSignOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnitSuccess) {
          customReplacementNavigate(context, '/');
        } else if (state is AuthFailure) {
          showToast(state.message, context);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CustomLoader();
        }
        return const Text(
          'SignOut',
          style: TextStyle(color: Colors.red),
        );
      },
    );
  }
}
