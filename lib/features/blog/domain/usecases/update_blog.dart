import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/blog/domain/repositories/blog_repository.dart';

class UpdateBlog implements UseCase<Blog, UpdateBlogParams> {
  final BlogRepository blogRepository;

  UpdateBlog(this.blogRepository);

  @override
  Future<Either<Failures, Blog>> call(UpdateBlogParams params) async {
    return await blogRepository.updateBlog(
        images: params.images,
        title: params.title,
        content: params.content,
        topics: params.topics,
        blogId: params.blogId,
        posterId: params.posterId,
        updatedAt: params.updatedAt);
  }
}

class UpdateBlogParams {
  final List<File>? images;
  final String title;
  final String content;
  final List<String> topics;
  final String blogId;
  final String posterId;
  final DateTime updatedAt;

  UpdateBlogParams(
      {this.images,
      required this.title,
      required this.content,
      required this.topics,
      required this.blogId,
      required this.posterId,
      required this.updatedAt});
}
