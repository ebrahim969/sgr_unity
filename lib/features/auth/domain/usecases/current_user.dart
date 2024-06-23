import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/domain/repository/auth_reopsitory.dart';

class CurrentUser implements UseCase<UserEntity, NoParams> {
  final AuthRepository authRepository;

  CurrentUser(this.authRepository);
  @override
  Future<Either<Failures, UserEntity>> call(NoParams params) async {
    return await authRepository.getCurrentUserData();
  }
}
