import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/blog/domain/repositories/user_saved_blogs_repository.dart';

class FetchSavedUserBlogsId
    implements UseCase<List<String>, FetchSavedUserBlogsParams> {
  final UserSavedBlogsRepository savedBlogsRepository;

  FetchSavedUserBlogsId(this.savedBlogsRepository);
  @override
  Future<Either<Failures, List<String>>> call(
      FetchSavedUserBlogsParams params) async {
    return await savedBlogsRepository.fetchUserSavedBlogsId(
        userId: params.userId);
  }
}

class FetchSavedUserBlogsParams {
  final String userId;

  FetchSavedUserBlogsParams({required this.userId});
}
