import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';

abstract interface class BlogRepository {
  Future<Either<Failures, Blog>> uploadBlog({
    required List<File>? image,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });
  Future<Either<Failures, List<Blog>>> getAllBlogs();
  Future<Either<Failures, List<Blog>>> getTopicBlogs({required String topic});
  Future<Either<Failures, Unit>> deleteBlog({required String id});
  Future<Either<Failures, Blog>> updateBlog({
    List<File>? images,
    required String title,
    required String content,
    required List<String> topics,
    required String blogId,
    required String posterId,
    required DateTime updatedAt,
  });
}
