import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/app/function/check_app_local.dart';
import 'package:sgr_unity/features/auth/data/models/user_model.dart';
import 'package:sgr_unity/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:sgr_unity/features/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ConnectionChecker connectionChecker;
  ProfileRepositoryImpl(this.profileRemoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failures, List<Blog>>> getCurrentUserBlogs() async {
    try {
      if (!(await connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'No Internet, Please try later'));
      }
      final blogs = await profileRemoteDataSource.getCurrentUserBlogs();
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> updateUserData({
    required String name,
    File? profileAvatar,
    String? shortBio,
    required String id,
    required String email,
  }) async {
    try {
      if (!(await connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'No Internet, Please try later'));
      }
      UserModel userModel =
          UserModel(id: id, email: email, name: name, shortBio: shortBio);
      if (profileAvatar != null) {
        final profilePic = await profileRemoteDataSource.uploadProfileAvatar(
            image: profileAvatar);
        userModel = userModel.copyWith(profileAvatar: profilePic);
      }

      final user =
          await profileRemoteDataSource.updateUserProfile(userModel: userModel);
      return right(user);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<Blog>>> getAnyUserBlogs(
      {required String userId}) async {
    try {
      if (!(await connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'No Internet, Please try later'));
      }
      final userBlogs =
          await profileRemoteDataSource.getAnyUserBlogs(userId: userId);
      return right(userBlogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getAnyUserInfo(
      {required String userId}) async {
    try {
      if (!(await connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'No Internet, Please try later'));
      }
      final userInfo =
          await profileRemoteDataSource.getAnyUserInfo(userId: userId);
      return right(userInfo);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }
}
