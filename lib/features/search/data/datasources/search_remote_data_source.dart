import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class SearchRemoteDataSource {
  Future<List<BlogModel>> searchAboutBlogs({required String query});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final SupabaseClient supabaseClient;

  SearchRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<List<BlogModel>> searchAboutBlogs({required String query}) async {
    try {
      final response = await supabaseClient
          .from('blogs')
          .select('*, profiles(name, profile_avatar)')
          .or('content.ilike.%$query%,title.ilike.%$query%');
      return response
          .map((blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'],
              posterAvatar: blog['profiles']['profile_avatar']))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
