import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/error/failures.dart';

abstract interface class ProfileRepository {
  Future<Either<Failures, List<Blog>>> getCurrentUserBlogs();
  Future<Either<Failures, UserEntity>> updateUserData(
      {required String name,
      File? profileAvatar,
      String? shortBio,
      required String id,
      required String email});
  Future<Either<Failures, UserEntity>> getAnyUserInfo({required String userId});
  Future<Either<Failures, List<Blog>>> getAnyUserBlogs(
      {required String userId});
}
