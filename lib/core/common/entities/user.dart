class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? profileAvatar;
  final String? shortBio;

  UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.profileAvatar,
    this.shortBio,
  });
}
