import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/profile/domain/usecase/get_user_blogs.dart';
import 'package:sgr_unity/features/profile/domain/usecase/update_user_data.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/get_current_user/getusers_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserBlogs _getUserBlogs;
  final UpdateUserData _updateUserData;
  final GetCurrentUserBloc _getCurrentUserBloc;
  ProfileBloc({
    required GetUserBlogs getUserBlogs,
    required UpdateUserData updateUserData,
    required GetCurrentUserBloc getCurrentuserBloc,
  })  : _getUserBlogs = getUserBlogs,
        _updateUserData = updateUserData,
        _getCurrentUserBloc = getCurrentuserBloc,
        super(ProfileInitial()) {
    on<GetUserBlogsEvent>(_onGetUserBlogsEvent);
    on<UpdateUserDataEvent>(_onUpdateUserDataEvent);
  }
  void _onGetUserBlogsEvent(
      GetUserBlogsEvent event, Emitter<ProfileState> emit) async {
    emit(GetUserBlogsLaoding());
    final res = await _getUserBlogs(NoParams());

    res.fold((failure) {
      emit(GetUserBlogsFailure(failure.message));
    }, (blogs) {
      emit(GetUserBlogsSuccess(blogs));
    });
  }

  void _onUpdateUserDataEvent(
      UpdateUserDataEvent event, Emitter<ProfileState> emit) async {
    emit(UpdateUserLoading());
    final res = await _updateUserData(UpdateUserDataParams(
        name: event.name,
        email: event.email,
        id: event.id,
        profileAvatar: event.image,
        shortBio: event.shortBio));
    res.fold((failure) {
      log(failure.message);
      add(GetUserBlogsEvent());
      emit(UpdateUserFailure(failure.message));
    }, (user) {
      _getCurrentUserBloc.add(GetCurrentUserDataEvent());
      add(GetUserBlogsEvent());
      emit(UpdateUserSuccess());
    });
  }
}
