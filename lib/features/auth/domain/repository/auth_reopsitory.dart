import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failures, Unit>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failures, UserEntity>> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures, UserEntity>> getCurrentUserData();

  Future<Either<Failures, Unit>> signOut();
}
