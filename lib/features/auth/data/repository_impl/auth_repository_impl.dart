import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/data/models/user_model.dart';
import 'package:sgr_unity/features/auth/domain/repository/auth_reopsitory.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final ConnectionChecker connectionChecker;
  AuthRepositoryImpl(this.authRemoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failures, UserEntity>> logInWithEmailPassword(
      {required String email, required String password}) async {
    return _getUser(() async => await authRemoteDataSource
        .logInWithEmailPassword(email: email, password: password));
  }

  @override
  Future<Either<Failures, Unit>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await authRemoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getCurrentUserData() async {
    try {
      if (!await (connectionChecker.isConnected)) {
        final session = authRemoteDataSource.currentUserSession;
        if (session == null) {
          return left(Failures('User not logged in!'));
        }
        return right(
          UserModel(
            id: session.user.id,
            email: session.user.email ?? '',
            name: '',
          ),
        );
      }
      final user = await authRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failures('User is not logedin'));
      }
      return right(user);
    } on ServerException catch (e) {
      return left(Failures(e.toString()));
    }
  }

  Future<Either<Failures, UserEntity>> _getUser(
    Future<UserEntity> Function() fn,
  ) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, Unit>> signOut() async {
    try {
      await authRemoteDataSource.signOutUser();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
