import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/app/function/check_app_local.dart';
import 'package:sgr_unity/features/blog/data/datasources/blog_local_data_source.dart';
import 'package:sgr_unity/features/blog/data/datasources/blog_remote_data_source.dart';
import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/domain/repositories/blog_repository.dart';
import 'package:uuid/uuid.dart';

class BlogRepositoryImpl implements BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;
  final BlogLocalDataSource blogLocalDataSource;
  final ConnectionChecker connectionChecker;
  BlogRepositoryImpl(this.blogRemoteDataSource, this.blogLocalDataSource,
      this.connectionChecker);
  @override
  Future<Either<Failures, Blog>> uploadBlog({
    required List<File>? image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'Check your internet connection...'));
      }
      BlogModel blogModel = BlogModel(
          id: const Uuid().v1(),
          posterId: posterId,
          title: title,
          content: content,
          imageUrl: [],
          updatedAt: DateTime.now(),
          topics: topics);

      if (image != null) {
        final imageUrl = await blogRemoteDataSource.uploadBlogImage(
          image: image,
          blog: blogModel,
        );
        blogModel = blogModel.copyWith(imageUrl: imageUrl);
      }

      final uploadedBlog = await blogRemoteDataSource.uploadBlogs(blogModel);
      return right(uploadedBlog);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, List<Blog>>> getAllBlogs() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final blogs = blogLocalDataSource.loadBlogs();
        return right(blogs);
      }
      final blogs = await blogRemoteDataSource.getAllBlogs();
      blogLocalDataSource.uploadLocalBlogs(blogs: blogs);
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, List<Blog>>> getTopicBlogs(
      {required String topic}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'Check your internet connection...'));
      }
      final blogs = await blogRemoteDataSource.getTopicBlogs(topic: topic);
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, Unit>> deleteBlog(
      {required String id, required List<String> imageUrls}) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'Check your internet connection...'));
      }
      await blogRemoteDataSource.deleteBlog(id: id, imageUrls: imageUrls);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, Blog>> updateBlog({
    List<File>? images,
    required String title,
    required String content,
    required List<String> topics,
    required String blogId,
    required String posterId,
    required DateTime updatedAt,
  }) async {
    try {
      if (!await (connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'Check your internet connection...'));
      }
      BlogModel blogModel = BlogModel(
          imageUrl: null,
          id: blogId,
          posterId: posterId,
          title: title,
          content: content,
          updatedAt: updatedAt,
          topics: topics);
      if (images != null) {
        final imageUrl = await blogRemoteDataSource.uploadBlogImage(
          image: images,
          blog: blogModel,
        );
        blogModel = blogModel.copyWith(imageUrl: imageUrl);
      }
      final updateBlog =
          await blogRemoteDataSource.updateBlog(blogModel: blogModel);
      return right(updateBlog);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
