import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/blog/domain/repositories/blog_repository.dart';

class DeleteBlog implements UseCase<Unit, DeleteBlogParams> {
  final BlogRepository blogRepository;

  DeleteBlog(this.blogRepository);
  @override
  Future<Either<Failures, Unit>> call(DeleteBlogParams params) async {
    return blogRepository.deleteBlog(id: params.id);
  }
}

class DeleteBlogParams {
  final String id;

  DeleteBlogParams({required this.id});
}
