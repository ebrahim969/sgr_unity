part of 'get_any_user_blogs_bloc.dart';

@immutable
sealed class GetAnyUserBlogsState {}

final class GetAnyUserBlogsInitial extends GetAnyUserBlogsState {}
final class GetAnyUserBlogsLoading extends GetAnyUserBlogsState {}

final class GetAnyUserBlogsSuccess extends GetAnyUserBlogsState {
  final List<Blog> blogs;

  GetAnyUserBlogsSuccess(this.blogs);
}

final class GetAnyUserBlogsFailure extends GetAnyUserBlogsState {
  final String errorMessage;

  GetAnyUserBlogsFailure(this.errorMessage);
}
