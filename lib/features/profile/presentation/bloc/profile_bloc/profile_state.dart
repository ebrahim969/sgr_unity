part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final UserEntity userData;

  ProfileSuccess(this.userData);
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}

final class GetUserBlogsSuccess extends ProfileState {
  final List<Blog> blogs;

  GetUserBlogsSuccess(this.blogs);
}

final class GetUserBlogsLaoding extends ProfileState {}

final class GetUserBlogsFailure extends ProfileState {
  final String errMessage;

  GetUserBlogsFailure(this.errMessage);
}

final class UpdateUserLoading extends ProfileState {}

final class UpdateUserSuccess extends ProfileState {}

final class UpdateUserFailure extends ProfileState {
  final String errMessage;

  UpdateUserFailure(this.errMessage);
}
