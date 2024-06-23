import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/profile/domain/usecase/get_any_user_info.dart';

part 'get_any_user_info_event.dart';
part 'get_any_user_info_state.dart';

class GetAnyUserInfoBloc
    extends Bloc<GetAnyUserInfoEvent, GetAnyUserInfoState> {
  final GetAnyUserInfo _getAnyUserInfo;
  GetAnyUserInfoBloc({
    required GetAnyUserInfo getAnyUserInfo,
  })  : _getAnyUserInfo = getAnyUserInfo,
        super(GetAnyUserInfoInitial()) {
    on<EventGetAnyUserInfo>(_onGetAnyUserInfoEvent);
  }

  void _onGetAnyUserInfoEvent(
      EventGetAnyUserInfo event, Emitter<GetAnyUserInfoState> emit) async {
    emit(GetAnyUserInfoLoading());
    final res = await _getAnyUserInfo(GetUserIdParam(userId: event.userId));
    res.fold((failure) => emit(GetAnyUserInfoFailure(failure.message)), (user) {
      emit(GetAnyUserInfoSuccess(user));
    });
  }
}
