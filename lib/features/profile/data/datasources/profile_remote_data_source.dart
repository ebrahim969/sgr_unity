import 'dart:io';

import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class ProfileRemoteDataSource {
  Future<List<BlogModel>> getCurrentUserBlogs();
  Future<UserModel> getAnyUserInfo({required String userId});
  Future<List<BlogModel>> getAnyUserBlogs({required String userId});
  Future<String> uploadProfileAvatar({required File image});
  Future<UserModel> updateUserProfile({required UserModel userModel});
  Session? get currentUserSession;
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final SupabaseClient supabaseClient;

  ProfileRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;
  @override
  Future<List<BlogModel>> getCurrentUserBlogs() async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .select('*, profiles (name, profile_avatar)')
          .eq('poster_id', currentUserSession!.user.id).order('updated_at');
      final blogs = response
          .map((blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'],
              posterAvatar: blog['profiles']['profile_avatar']))
          .toList();
      return blogs;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> uploadProfileAvatar({required File image}) async {
    try {
      await supabaseClient.storage
          .from('profile_images')
          .upload(image.path, image);
      return supabaseClient.storage
          .from('profile_images')
          .getPublicUrl(image.path);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> updateUserProfile({required UserModel userModel}) async {
    try {
      final getCurrentAvatar = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', userModel.id)
          .single();
      final currentPic = getCurrentAvatar['profile_avatar'];
      final response = await supabaseClient
          .from('profiles')
          .update(userModel.toJson(currentProfileAvatar: currentPic))
          .eq('id', userModel.id)
          .select();
      return UserModel.fromJson(response.first)
          .copyWith(email: currentUserSession!.user.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getAnyUserBlogs({required String userId}) async {
    try {
      final userBlogs = await supabaseClient
          .from('blogs')
          .select('*, profiles (name, profile_avatar)')
          .eq('poster_id', userId).order('updated_at');
      return userBlogs
          .map((userBlog) => BlogModel.fromJson(userBlog).copyWith(
                posterAvatar: userBlog['profiles']['profile_avatar'],
                posterName: userBlog['profiles']['name'],
              ))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> getAnyUserInfo({required String userId}) async {
    try {
      final userData = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();
      return UserModel.fromJson(userData);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
