part of 'user_saved_blogs_bloc.dart';

@immutable
sealed class UserSavedBlogsEvent {}

final class ToggleSavedBlogEvent extends UserSavedBlogsEvent {
  final String userId;
  final String blogId;

  ToggleSavedBlogEvent({required this.userId, required this.blogId});
}

final class FetchUserSavedBlogsIdEvent extends UserSavedBlogsEvent {
  final String userId;

  FetchUserSavedBlogsIdEvent(this.userId);
}

final class GetUserSavedBlogsEvent extends UserSavedBlogsEvent {
  final String userId;

  GetUserSavedBlogsEvent(this.userId);
}
