import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/domain/usecases/delete_blog.dart';
import 'package:sgr_unity/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:sgr_unity/features/blog/domain/usecases/get_topic_blogs.dart';
import 'package:sgr_unity/features/blog/domain/usecases/update_blog.dart';
import 'package:sgr_unity/features/blog/domain/usecases/upload_blog.dart';
import 'package:sgr_unity/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;
  final GetTopicBlogs _getTopicBlogs;
  final DeleteBlog _deleteBlog;
  final UpdateBlog _updateBlog;
  final ProfileBloc _profileBloc;
  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
    required GetTopicBlogs getTopicBlogs,
    required DeleteBlog deleteBlog,
    required UpdateBlog updateBlog,
    required ProfileBloc profileBloc,
  })  : _uploadBlog = uploadBlog,
        _getAllBlogs = getAllBlogs,
        _getTopicBlogs = getTopicBlogs,
        _deleteBlog = deleteBlog,
        _updateBlog = updateBlog,
        _profileBloc = profileBloc,
        super(BlogInitial()) {
    on<BlogEvent>((event, emit) async {
      emit(BlogLoading());
    });
    on<UploadBlogEvent>(_onUploadBlogEvent);
    on<GetAllBlogsEvent>(_onGetAllBlogsEvent);
    on<GetTopicBlogsEvent>(_onGetTopicsBlogsEvent);
    on<DeleteBlogEvent>(_onDeleteBlogEvent);
    on<UpdateBlogEvent>(_onUpdateBlogEvent);
  }

  void _onUploadBlogEvent(
      UploadBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _uploadBlog(UploadBlogParams(
      event.image,
      event.title,
      event.content,
      event.posterId,
      event.topics,
    ));

    res.fold((failure) {
      add(GetAllBlogsEvent());
      emit(BlogFailure(failure.message));
    }, (blog) {
      emit(UploadBlogSuccess());
    });
  }

  void _onGetAllBlogsEvent(
      GetAllBlogsEvent event, Emitter<BlogState> emit) async {
    final res = await _getAllBlogs(NoParams());
    res.fold((failure) {
      emit(BlogFailure(failure.message));
    }, (blogs) {
      emit(GetAllBlogSuccess(blogs));
    });
  }

  void _onGetTopicsBlogsEvent(
      GetTopicBlogsEvent event, Emitter<BlogState> emit) async {
    final res = await _getTopicBlogs(GetTopicBlogsParams(topic: event.topic));
    res.fold((failure) {
      emit(BlogFailure(failure.message));
    }, (blogs) {
      emit(GetAllBlogSuccess(blogs));
    });
  }

  FutureOr<void> _onDeleteBlogEvent(
      DeleteBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _deleteBlog(
        DeleteBlogParams(id: event.id, imageUrls: event.imageUrls));

    res.fold((failure) {
      emit(BlogFailure(failure.message));
    }, (success) {
      emit(DeleteBlogSuccess());
      add(GetAllBlogsEvent());
    });
  }

  void _onUpdateBlogEvent(
      UpdateBlogEvent event, Emitter<BlogState> emit) async {
    final res = await _updateBlog(UpdateBlogParams(
      images: event.image,
      title: event.title,
      content: event.content,
      topics: event.topics,
      blogId: event.blogId,
      posterId: event.posterId,
      updatedAt: event.updatedAt,
    ));

    res.fold((failure) {
      log(failure.message);
      add(GetAllBlogsEvent());
      emit(BlogFailure(failure.message));
    }, (blog) {
      add(GetAllBlogsEvent());
      _profileBloc.add(GetUserBlogsEvent());
      emit(UpdateBlogSuccess(blog));
    });
  }
}
