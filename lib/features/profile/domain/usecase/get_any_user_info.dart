import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/profile/domain/repository/profile_repository.dart';

class GetAnyUserInfo implements UseCase<UserEntity, GetUserIdParam> {
  final ProfileRepository profileRepository;

  GetAnyUserInfo(this.profileRepository);
  @override
  Future<Either<Failures, UserEntity>> call(GetUserIdParam params) async {
    return profileRepository.getAnyUserInfo(userId: params.userId);
  }
}

class GetUserIdParam {
  final String userId;

  GetUserIdParam({required this.userId});
}
