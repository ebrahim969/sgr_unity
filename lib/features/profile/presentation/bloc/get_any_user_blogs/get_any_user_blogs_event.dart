part of 'get_any_user_blogs_bloc.dart';

@immutable
sealed class GetAnyUserBlogsEvent {}

final class EventGetAnyUserBlogs extends GetAnyUserBlogsEvent {
  final String userId;

  EventGetAnyUserBlogs(this.userId);
}
