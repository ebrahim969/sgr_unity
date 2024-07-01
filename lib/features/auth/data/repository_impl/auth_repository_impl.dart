import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/app/function/check_app_local.dart';
import 'package:sgr_unity/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/features/auth/data/datasources/user_info_local_data_source.dart';
import 'package:sgr_unity/features/auth/domain/repository/auth_reopsitory.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final UserInfoLocalDataSource userInfoLocalDataSource;
  final ConnectionChecker connectionChecker;
  AuthRepositoryImpl(this.authRemoteDataSource, this.connectionChecker,
      this.userInfoLocalDataSource);
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
          return left(Failures(
              isArabic() ? 'المستخدم غير مسجل' : 'User not logged in!'));
        }
        final user = userInfoLocalDataSource.loadUserInfo();
        return right(user);
      }
      final user = await authRemoteDataSource.getCurrentUserData();
      if (user == null) {
        return left(Failures(
            isArabic() ? 'المستخدم غير مسجل' : 'User is not logged in!'));
      }
      userInfoLocalDataSource.uploadLocalUserInfo(user: user);
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
      if (!await (connectionChecker.isConnected)) {
        return left(Failures(isArabic()
            ? 'تفقد اتصالك بالأنترنت...'
            : 'Check yur internet connection...'));
      }
      await authRemoteDataSource.signOutUser();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
