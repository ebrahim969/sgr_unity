import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/auth/domain/usecases/current_user.dart';

part 'getusers_event.dart';
part 'getusers_state.dart';

class GetCurrentUserBloc extends Bloc<GetUsersEvent, GetUsersState> {
  final CurrentUser _currentUser;

  GetCurrentUserBloc({
    required CurrentUser currentUser,
  })  : _currentUser = currentUser,
        super(GetUsersInitial()) {
    on<GetCurrentUserDataEvent>(_onGetCurrentUserDataEvent);
  }

  void _onGetCurrentUserDataEvent(
      GetCurrentUserDataEvent event, Emitter<GetUsersState> emit) async {
    emit(GetUserLoading());
    final res = await _currentUser(NoParams());
    res.fold((failure) => emit(GetUserFailure(failure.message)),
        (user) => emit(GetUserSuccess(user)));
  }
}
