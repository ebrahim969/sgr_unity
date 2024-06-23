part of 'get_any_user_info_bloc.dart';

@immutable
sealed class GetAnyUserInfoEvent {}

final class EventGetAnyUserInfo extends GetAnyUserInfoEvent {
  final String userId;

  EventGetAnyUserInfo(this.userId);
}
