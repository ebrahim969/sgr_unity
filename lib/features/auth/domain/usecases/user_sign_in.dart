import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/domain/repository/auth_reopsitory.dart';

class UserSignIn implements UseCase<UserEntity, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn(this.authRepository);
  @override
  Future<Either<Failures, UserEntity>> call(UserSignInParams params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
