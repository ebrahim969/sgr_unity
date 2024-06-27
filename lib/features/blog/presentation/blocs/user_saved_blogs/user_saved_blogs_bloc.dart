import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/domain/entities/saved_blog_entity.dart';
import 'package:sgr_unity/features/blog/domain/usecases/fetch_user_saved_blogs_id.dart';
import 'package:sgr_unity/features/blog/domain/usecases/get_user_saved_blogs.dart';
import 'package:sgr_unity/features/blog/domain/usecases/toggle_saved_user_blog.dart';

part 'user_saved_blogs_event.dart';
part 'user_saved_blogs_state.dart';

class UserSavedBlogsBloc
    extends Bloc<UserSavedBlogsEvent, UserSavedBlogsState> {
  final ToggleSavedUserBlog _toggleSavedUserBlog;
  final GetUserSavedBlogs _getUserSavedBlogs;
  UserSavedBlogsBloc({
    required ToggleSavedUserBlog toggleSavedUserBlog,
    required FetchSavedUserBlogsId fetchSavedUserBlogs,
    required GetUserSavedBlogs getUserSavedBlogs,
  })  : _toggleSavedUserBlog = toggleSavedUserBlog,
        _getUserSavedBlogs = getUserSavedBlogs,
        super(UserSavedBlogsInitial()) {
    on<ToggleSavedBlogEvent>(_onToggleSavedBlogEvent);
    on<GetUserSavedBlogsEvent>(_onGetUserSavedBlogs);
  }

  void _onToggleSavedBlogEvent(
      ToggleSavedBlogEvent event, Emitter<UserSavedBlogsState> emit) async {
    final res = await _toggleSavedUserBlog(
        SaveBlogParams(blogid: event.blogId, userId: event.userId));
    res.fold((failure) => emit(UserSavedBlogsFailure(failure.message)),
        (savedBlog) {
      add(GetUserSavedBlogsEvent(savedBlog.userId));
    });
  }

  void _onGetUserSavedBlogs(
      GetUserSavedBlogsEvent event, Emitter<UserSavedBlogsState> emit) async {
    emit(UserSavedBlogsLoading());
    final res =
        await _getUserSavedBlogs(GetUserSavedBlogsParams(userId: event.userId));

    res.fold((failure) => emit(UserSavedBlogsFailure(failure.message)),
        (savedBlogs) => emit(GetUserSavedBlogsSuccess(savedBlogs)));
  }
}
