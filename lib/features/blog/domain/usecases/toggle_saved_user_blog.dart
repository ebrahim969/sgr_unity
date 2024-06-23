import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/blog/domain/entities/saved_blog_entity.dart';
import 'package:sgr_unity/features/blog/domain/repositories/user_saved_blogs_repository.dart';

class ToggleSavedUserBlog implements UseCase<SavedBlog, SaveBlogParams> {
  final UserSavedBlogsRepository userSavedBlogsRepository;

  ToggleSavedUserBlog(this.userSavedBlogsRepository);
  @override
  Future<Either<Failures, SavedBlog>> call(SaveBlogParams params) async {
    return await userSavedBlogsRepository.toggleSavedUserBlogs(
        userId: params.userId, blogId: params.blogid);
  }
}

class SaveBlogParams {
  final String userId;
  final String blogid;

  SaveBlogParams({required this.blogid, required this.userId});
}
