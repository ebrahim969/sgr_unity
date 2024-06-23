import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/profile/domain/repository/profile_repository.dart';

class GetUserBlogs implements UseCase<List<Blog>, NoParams> {
  final ProfileRepository profileRepository;

  GetUserBlogs(this.profileRepository);
  @override
  Future<Either<Failures, List<Blog>>> call(NoParams params) async {
    return await profileRepository.getCurrentUserBlogs();
  }
}
