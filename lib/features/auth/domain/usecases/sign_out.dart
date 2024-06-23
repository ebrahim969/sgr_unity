import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/auth/domain/repository/auth_reopsitory.dart';

class UserSignOut implements UseCase<Unit, NoParams> {
  final AuthRepository authRepository;

  UserSignOut(this.authRepository);
  @override
  Future<Either<Failures, Unit>> call(NoParams params) {
    return authRepository.signOut();
  }
}
