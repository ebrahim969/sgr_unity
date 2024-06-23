part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class UnitBlogSuccess extends BlogState {}

final class BlogFailure extends BlogState {
  final String message;

  BlogFailure(this.message);
}

final class GetAllBlogSuccess extends BlogState {
  final List<Blog> blogs;

  GetAllBlogSuccess(this.blogs);
}

final class UpdateBlogSuccess extends BlogState {
  final Blog blog;

  UpdateBlogSuccess(this.blog);
}
