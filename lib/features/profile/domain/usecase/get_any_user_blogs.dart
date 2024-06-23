import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/profile/domain/repository/profile_repository.dart';
import 'package:sgr_unity/features/profile/domain/usecase/get_any_user_info.dart';

class GetAnyUserBlogs implements UseCase<List<Blog>, GetUserIdParam> {
  final ProfileRepository profileRepository;

  GetAnyUserBlogs(this.profileRepository);
  @override
  Future<Either<Failures, List<Blog>>> call(GetUserIdParam params) async {
    return profileRepository.getAnyUserBlogs(userId: params.userId);
  }
}
