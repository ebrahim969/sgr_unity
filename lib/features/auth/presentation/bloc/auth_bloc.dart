import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/data/function/user_state.dart';
import 'package:sgr_unity/features/auth/domain/usecases/sign_out.dart';
import 'package:sgr_unity/features/auth/domain/usecases/user_sign_in.dart';
import 'package:sgr_unity/features/auth/domain/usecases/user_sign_up.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final UserSignOut _userSignOut;
  AuthBloc(
      {required UserSignUp userSignUp,
      required UserSignIn userSignIn,
      required UserSignOut userSignOut,
      required GetCurrentUserBloc getCurrentuserBloc,
      required})
      : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _userSignOut = userSignOut,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthUserSignOut>(_onAuthUserSignOut);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    final res = await _userSignUp(
      UserSignUpParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
    res.fold((failure) {
      log(failure.message);
      emit(AuthFailure(failure.message));
    }, (user) => emit(UnitSuccess()));
  }

  void _onAuthSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final res = await _userSignIn(UserSignInParams(
      email: event.email,
      password: event.password,
    ));

    res.fold((failure) {
      log(failure.message);
      emit(AuthFailure(failure.message));
    }, (user) {
      userIsLoggedIn();
      emit(AuthSuccess(user));
    });
  }

  void _onAuthUserSignOut(
      AuthUserSignOut event, Emitter<AuthState> emit) async {
    final res = await _userSignOut(NoParams());
    res.fold((failure) {
      emit(AuthFailure(failure.message));
    }, (unit) {
      userIsLoggedOut();
      emit(UnitSuccess());
    });
  }
}
