part of 'getusers_bloc.dart';

@immutable
sealed class GetUsersState {}

final class GetUsersInitial extends GetUsersState {}

final class GetUserLoading extends GetUsersState {}

final class GetUserSuccess extends GetUsersState {
  final UserEntity user;

  GetUserSuccess(this.user);
}

final class GetUserFailure extends GetUsersState {
  final String errMessage;

  GetUserFailure(this.errMessage);
}

final class GetAnyUserBlogsLoading extends GetUsersState {}

final class GetAnyUserBlogsSuccess extends GetUsersState {
  final List<Blog> blogs;

  GetAnyUserBlogsSuccess(this.blogs);
}

final class GetAnyUserBlogsFailure extends GetUsersState {
  final String errMessage;

  GetAnyUserBlogsFailure(this.errMessage);
}
