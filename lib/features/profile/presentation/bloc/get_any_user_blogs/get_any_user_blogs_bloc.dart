import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/profile/domain/usecase/get_any_user_blogs.dart';
import 'package:sgr_unity/features/profile/domain/usecase/get_any_user_info.dart';

part 'get_any_user_blogs_event.dart';
part 'get_any_user_blogs_state.dart';

class GetAnyUserBlogsBloc
    extends Bloc<GetAnyUserBlogsEvent, GetAnyUserBlogsState> {
  final GetAnyUserBlogs _getAnyUserBlogs;

  GetAnyUserBlogsBloc({
    required GetAnyUserBlogs getAnyUserBlogs,
  })  : _getAnyUserBlogs = getAnyUserBlogs,
        super(GetAnyUserBlogsInitial()) {
    on<EventGetAnyUserBlogs>(_onGetAnyUserBlogsEvent);
  }

  void _onGetAnyUserBlogsEvent(
      EventGetAnyUserBlogs event, Emitter<GetAnyUserBlogsState> emit) async {
    emit(GetAnyUserBlogsLoading());
    final res = await _getAnyUserBlogs(GetUserIdParam(userId: event.userId));
    res.fold((failure) => emit(GetAnyUserBlogsFailure(failure.message)),
        (blogs) => emit(GetAnyUserBlogsSuccess(blogs)));
  }
}
