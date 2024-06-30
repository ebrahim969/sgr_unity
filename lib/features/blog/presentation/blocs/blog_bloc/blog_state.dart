part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class GetAllBlogsLoading extends BlogState {}
final class UploadBlogLoading extends BlogState {}
final class UpdateBlogLoading extends BlogState {}
final class DeleteBlogLoading extends BlogState {}

// Failure States
final class GetAllBlogsFailure extends BlogState {
  final String message;

  GetAllBlogsFailure(this.message);
}

final class UploadBlogFailure extends BlogState {
  final String message;

  UploadBlogFailure(this.message);
}
final class UpdateBlogFailure extends BlogState {
  final String message;

  UpdateBlogFailure(this.message);
}
final class DeleteBlogFailure extends BlogState {
  final String message;

  DeleteBlogFailure(this.message);
}

final class DeleteBlogSuccess extends BlogState {}
final class UploadBlogSuccess extends BlogState {}

final class GetAllBlogSuccess extends BlogState {
  final List<Blog> blogs;

  GetAllBlogSuccess(this.blogs);
}

final class UpdateBlogSuccess extends BlogState {
  final Blog blog;

  UpdateBlogSuccess(this.blog);
}
