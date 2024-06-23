part of 'getusers_bloc.dart';

@immutable
sealed class GetUsersEvent {}

final class GetCurrentUserDataEvent extends GetUsersEvent {}


final class GetAnyUserBlogsEvent extends GetUsersEvent {
  final String userId;

  GetAnyUserBlogsEvent(this.userId);
}
