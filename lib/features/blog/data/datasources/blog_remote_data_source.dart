import 'dart:developer';
import 'dart:io';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlogs(BlogModel blog);
  Future<List<String>> uploadBlogImage(
      {required List<File> image, required BlogModel blog});
  Future<List<BlogModel>> getAllBlogs();
  Future<List<BlogModel>> getTopicBlogs({required String topic});
  Future<BlogModel> updateBlog({required BlogModel blogModel});
  Future<void> deleteBlog({required String id});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<BlogModel> uploadBlogs(BlogModel blog) async {
    try {
      final blogData =
          await supabaseClient.from('blogs').insert(blog.toJson()).select();
      return BlogModel.fromJson(blogData.first);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<BlogModel> updateBlog({required BlogModel blogModel}) async {
    try {
      final getCurrentImagesUrl = await supabaseClient
          .from('blogs')
          .select()
          .eq('id', blogModel.id)
          .single();
      List<dynamic> currentImages = getCurrentImagesUrl['image_url'];
      log(currentImages.toString());
      ////////////////////////////////////////////////////////////////
      final response = await supabaseClient
          .from('blogs')
          .update(
              blogModel.toJson(currentImagesUrls: currentImages.cast<String>()))
          .eq('id', blogModel.id)
          .select();
      log(response.toString());
      final updateBlog = BlogModel.fromJson(response.first);
      return updateBlog;
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<String>> uploadBlogImage({
    required List<File> image,
    required BlogModel blog,
  }) async {
    try {
      List<String> imageUrls = [];
      for (File selectedImage in image) {
        final bytes = await selectedImage.readAsBytes();
        await supabaseClient.storage
            .from('blog_images')
            .uploadBinary(selectedImage.path, bytes);
        final urlResponse = await getImageUrl(selectedImage.path);
        if (urlResponse != null) {
          log(urlResponse);
          imageUrls.add(urlResponse);
        }
      }
      return imageUrls;
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<String?> getImageUrl(String path) async {
    final response =
        supabaseClient.storage.from('blog_images').getPublicUrl(path);
    return response;
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final blogs = await supabaseClient
          .from('blogs')
          .select('*, profiles (name, profile_avatar)');
      return blogs
          .map((blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'],
              posterAvatar: blog['profiles']['profile_avatar']))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<BlogModel>> getTopicBlogs({required String topic}) async {
    try {
      final blogs = await supabaseClient
          .from('blogs')
          .select('*, profiles (name, profile_avatar)')
          .contains('topics', [topic]);
      return blogs
          .map((blog) => BlogModel.fromJson(blog).copyWith(
              posterName: blog['profiles']['name'],
              posterAvatar: blog['profiles']['profile_avatar']))
          .toList();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteBlog({required String id}) async {
    try {
      await supabaseClient.from('blogs').delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
