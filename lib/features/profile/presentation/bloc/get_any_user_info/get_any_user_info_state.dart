part of 'get_any_user_info_bloc.dart';

@immutable
sealed class GetAnyUserInfoState {}

final class GetAnyUserInfoInitial extends GetAnyUserInfoState {}

final class GetAnyUserInfoLoading extends GetAnyUserInfoState {}

final class GetAnyUserInfoSuccess extends GetAnyUserInfoState {
  final UserEntity user;

  GetAnyUserInfoSuccess(this.user);
}

final class GetAnyUserInfoFailure extends GetAnyUserInfoState {
  final String errorMessage;

  GetAnyUserInfoFailure(this.errorMessage);
}
