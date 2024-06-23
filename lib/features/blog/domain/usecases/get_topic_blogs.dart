import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/blog/domain/repositories/blog_repository.dart';

class GetTopicBlogs implements UseCase<List<Blog>, GetTopicBlogsParams> {
  final BlogRepository blogRepository;

  GetTopicBlogs(this.blogRepository);
  @override
  Future<Either<Failures, List<Blog>>> call(GetTopicBlogsParams params) async {
    return await blogRepository.getTopicBlogs(topic: params.topic);
  }
}

class GetTopicBlogsParams {
  final String topic;

  GetTopicBlogsParams({required this.topic});
}
