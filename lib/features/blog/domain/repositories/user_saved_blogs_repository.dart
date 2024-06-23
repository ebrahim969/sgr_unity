import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/features/blog/domain/entities/saved_blog_entity.dart';

abstract interface class UserSavedBlogsRepository {
  Future<Either<Failures, SavedBlog>> toggleSavedUserBlogs({
    required String userId,
    required String blogId,
  });

  Future<Either<Failures, List<String>>> fetchUserSavedBlogsId({
    required String userId,
  });
  Future<Either<Failures, List<Blog>>> getSavedBlogs({required String userId});
}
