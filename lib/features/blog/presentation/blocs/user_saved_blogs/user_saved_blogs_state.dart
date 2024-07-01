part of 'user_saved_blogs_bloc.dart';

@immutable
sealed class UserSavedBlogsState {}

final class UserSavedBlogsInitial extends UserSavedBlogsState {}

final class UserSavedBlogsLoading extends UserSavedBlogsState {}

final class UserSavedBlogsSuccess extends UserSavedBlogsState {
  final SavedBlog savedBlog;

  UserSavedBlogsSuccess(this.savedBlog);
}

final class UserSavedBlogsFailure extends UserSavedBlogsState {
  final String errMessage;

  UserSavedBlogsFailure(this.errMessage);
}

final class GetUserSavedBlogsFailure extends UserSavedBlogsState {
  final String errMessage;

  GetUserSavedBlogsFailure(this.errMessage);
}

final class GetUserSavedBlogsSuccess extends UserSavedBlogsState {
  final List<Blog> savedBlogs;

  GetUserSavedBlogsSuccess(this.savedBlogs);
}
