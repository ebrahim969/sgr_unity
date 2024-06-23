import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/user.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/profile/domain/repository/profile_repository.dart';

class UpdateUserData implements UseCase<UserEntity, UpdateUserDataParams> {
  final ProfileRepository profileRepository;

  UpdateUserData(this.profileRepository);
  @override
  Future<Either<Failures, UserEntity>> call(UpdateUserDataParams params) async {
    return await profileRepository.updateUserData(
        name: params.name,
        profileAvatar: params.profileAvatar,
        shortBio: params.shortBio,
        id: params.id,
        email: params.email);
  }
}

class UpdateUserDataParams {
  final String name;
  final String email;
  final String id;
  final File? profileAvatar;
  final String? shortBio;

  UpdateUserDataParams(
      {required this.name,
      required this.email,
      required this.id,
      this.profileAvatar,
      this.shortBio});
}
