import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/blog/domain/repositories/user_saved_blogs_repository.dart';

class GetUserSavedBlogs
    implements UseCase<List<Blog>, GetUserSavedBlogsParams> {
  final UserSavedBlogsRepository userSavedBlogsRepository;

  GetUserSavedBlogs(this.userSavedBlogsRepository);
  @override
  Future<Either<Failures, List<Blog>>> call(
      GetUserSavedBlogsParams params) async {
    return userSavedBlogsRepository.getSavedBlogs(userId: params.userId);
  }
}

class GetUserSavedBlogsParams {
  final String userId;

  GetUserSavedBlogsParams({required this.userId});
}
