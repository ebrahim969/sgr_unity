part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}


final class GetUserBlogsEvent extends ProfileEvent {}

final class UpdateUserDataEvent extends ProfileEvent {
  final String id;
  final String name;
  final String email;
  final File? image;
  final String? shortBio;
  UpdateUserDataEvent(
      {required this.id, required this.name, required this.email, this.image, this.shortBio});
}
