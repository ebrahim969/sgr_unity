import 'package:sgr_unity/core/common/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    super.profileAvatar,
    super.shortBio,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'] ?? '',
      email: jsonData['email'] ?? '',
      name: jsonData['name'] ?? '',
      profileAvatar: jsonData['profile_avatar'],
      shortBio: jsonData['short_bio'],
    );
  }

  Map<String, dynamic> toJson({String? currentProfileAvatar}) {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profile_avatar': profileAvatar ?? currentProfileAvatar,
      'short_bio': shortBio,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? profileAvatar,
    String? shortBio,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileAvatar: profileAvatar ?? this.profileAvatar,
      shortBio: shortBio ?? this.shortBio,
    );
  }
}
