import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgr_unity/core/functions/navigation.dart';
import 'package:sgr_unity/core/theme/app_pallete.dart';
import 'package:sgr_unity/core/utils/widgets/custom_toast.dart';
import 'package:sgr_unity/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_btn.dart';
import 'package:sgr_unity/features/auth/presentation/widgets/custom_auth_form_feild.dart';
import 'package:sgr_unity/generated/l10n.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final txt = S.of(context);
    return Form(
      key: signUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30.h),
          CustomAuthTextFormFeild(
              maxLength: 16,
              hintText: txt.FullName,
              controller: fullNameController),
          //
          SizedBox(height: 15.h),
          CustomAuthTextFormFeild(
              hintText: txt.Email, controller: emailController),
          //
          SizedBox(height: 15.h),
          CustomAuthTextFormFeild(
            hintText: txt.Password,
            controller: passwordController,
            isObscureText: true,
          ),
          //
          SizedBox(height: 20.h),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignUpFailure) {
                showToast(state.message, context);
              }
              if (state is SignUpSuccess) {
                customReplacementNavigate(
                  context,
                  '/SignInView',
                );
                showToast(txt.PleaseconfirmyouremailandSignIn, context);
              }
            },
            builder: (context, state) {
              return CustomAuthBtn(
                  isLoading: state is SignUpLoading ? true : false,
                  buttonText: txt.SignUp,
                  onPressed: () {
                    if (signUpFormKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(AuthSignUp(
                          name: fullNameController.text,
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
                txt.Alreadyhaveanaccount,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton(
                onPressed: () {
                  customReplacementNavigate(context, '/SignInView');
                },
                child: Text(
                  txt.SignIn,
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
