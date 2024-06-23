import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/features/blog/data/models/saved_blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class UserSavedBlogsRemoteDataSource {
  Future<SavedBlogsModel> saveUserBlog(SavedBlogsModel saveBlogsModel);
  Future<SavedBlogsModel> deleteSavedUserBlog({required String blogId});
  Future<List<String>> fetchsavedUserBlogsId({required String userId});
  Future<List<BlogModel>> getSavedBlogs({required List<String> blogsId});
}

class UserSavedBlogsRemoteDataSourceImpl
    implements UserSavedBlogsRemoteDataSource {
  final SupabaseClient supabaseClient;

  UserSavedBlogsRemoteDataSourceImpl(this.supabaseClient);
  String userSavedBlogsTable = 'user_saved_blogs';
  @override
  Future<SavedBlogsModel> saveUserBlog(SavedBlogsModel saveBlogsModel) async {
    try {
      final savedUserBlog = await supabaseClient
          .from(userSavedBlogsTable)
          .insert(saveBlogsModel.toJson())
          .select();
      return SavedBlogsModel.fromJson(savedUserBlog.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SavedBlogsModel> deleteSavedUserBlog({required String blogId}) async {
    try {
      final deletesavedBlog = await supabaseClient
          .from(userSavedBlogsTable)
          .delete()
          .eq('blog_id', blogId)
          .select();

      return SavedBlogsModel.fromJson(deletesavedBlog.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> fetchsavedUserBlogsId({required String userId}) async {
    try {
      final fetchUserSavedBlogs = await supabaseClient
          .from(userSavedBlogsTable)
          .select()
          .eq('user_id', userId);
      final userSavedBlogs = fetchUserSavedBlogs
          .map((userSavedBlog) => SavedBlogsModel.fromJson(userSavedBlog))
          .toList();
      List<String> userBlogsId = [];
      for (var savedBlog in userSavedBlogs) {
        userBlogsId.add(savedBlog.blogId);
      }
      return userBlogsId;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getSavedBlogs({required List<String> blogsId}) async {
    try {
      final getSavedBlogs = await supabaseClient
          .from('blogs')
          .select('*, profiles (name, profile_avatar)')
          .inFilter('id', blogsId);
      return getSavedBlogs
          .map((savedBlog) => BlogModel.fromJson(savedBlog).copyWith(
              posterAvatar: savedBlog['profiles']['profile_avatar'],
              posterName: savedBlog['profiles']['name']))
          .toList();
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
