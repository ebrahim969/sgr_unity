part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class UploadBlogEvent extends BlogEvent {
  final List<File>? image;
  final String title;
  final String content;
  final String posterId;
  final List<String> topics;

  UploadBlogEvent(
    this.image,
    this.title,
    this.content,
    this.posterId,
    this.topics,
  );
}

final class GetAllBlogsEvent extends BlogEvent {}

final class GetTopicBlogsEvent extends BlogEvent {
  final String topic;

  GetTopicBlogsEvent(this.topic);
}

final class DeleteBlogEvent extends BlogEvent {
  final String id;

  DeleteBlogEvent(this.id);
}

final class UpdateBlogEvent extends BlogEvent {
  final List<File>? image;
  final String title;
  final String content;
  final String blogId;
  final String posterId;
  final List<String> topics;
  final DateTime updatedAt;

  UpdateBlogEvent(
      {this.image,
      required this.title,
      required this.content,
      required this.blogId,
      required this.posterId,
      required this.topics,
      required this.updatedAt});
}

final class SaveBlogEvent extends BlogEvent {
  final String blogId;
  final bool save;

  SaveBlogEvent({required this.blogId, required this.save});
}
