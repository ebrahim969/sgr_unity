import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_form_feild.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signInFormKey,
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomAuthTextFormFeild(
              hintText: 'Email', controller: emailController),
          //
          SizedBox(height: 15.h),
          CustomAuthTextFormFeild(
            hintText: 'Password',
            controller: passwordController,
            isObscureText: true,
          ),
          //
          SizedBox(height: 20.h),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                showToast(state.message, context);
              }
              if (state is AuthSuccess) {
                customReplacementNavigate(context, '/');
              }
            },
            builder: (context, state) {
              return CustomAuthBtn(
                  isLoading: state is AuthLoading ? true : false,
                  buttonText: 'SignIn',
                  onPressed: () {
                    if (signInFormKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthSignIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()));
                    }
                  });
            },
          ),
          //
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  customReplacementNavigate(context, '/SignUpView');
                },
                child: Text(
                  'SignUp',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient3,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
