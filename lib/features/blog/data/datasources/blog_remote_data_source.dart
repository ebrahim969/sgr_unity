import 'dart:developer';
import 'dart:io';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/common/models/blog_model.dart';
import 'package:sgr_unity/core/utils/strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

abstract interface class BlogRemoteDataSource {
  Future<BlogModel> uploadBlogs(BlogModel blog);
  Future<List<String>> uploadBlogImage(
      {required List<File> image, required BlogModel blog});
  Future<List<BlogModel>> getAllBlogs();
  Future<List<BlogModel>> getTopicBlogs({required String topic});
  Future<BlogModel> updateBlog({required BlogModel blogModel});
  Future<void> deleteBlog(
      {required String id, required List<String> imageUrls});
}

class BlogRemoteDataSourceImpl implements BlogRemoteDataSource {
  final SupabaseClient supabaseClient;

  BlogRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<BlogModel> uploadBlogs(BlogModel blog) async {
    try {
      final blogData =
          await supabaseClient.from(DbStrings.blogsTable).insert(blog.toJson()).select();
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
          .from(DbStrings.blogsTable)
          .select()
          .eq('id', blogModel.id)
          .single();
      List<dynamic> currentImages = getCurrentImagesUrl['image_url'];
      log(currentImages.toString());
      ////////////////////////////////////////////////////////////////
      final response = await supabaseClient
          .from(DbStrings.blogsTable)
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
        String selectedImagePath = const Uuid().v1();
        final bytes = await selectedImage.readAsBytes();
        await supabaseClient.storage
            .from(DbStrings.blogImagesStorage)
            .uploadBinary(selectedImagePath, bytes);
        final urlResponse = await getImageUrl(selectedImagePath);
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
        supabaseClient.storage.from(DbStrings.blogImagesStorage).getPublicUrl(path);
    return response;
  }

  @override
  Future<List<BlogModel>> getAllBlogs() async {
    try {
      final blogs = await supabaseClient
          .from(DbStrings.blogsTable)
          .select('*, profiles (name, profile_avatar)')
          .order('updated_at');
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
          .from(DbStrings.blogsTable)
          .select('*, profiles (name, profile_avatar)')
          .contains('topics', [topic]).order('updated_at');
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
  Future<void> deleteBlog(
      {required String id, required List<String> imageUrls}) async {
    try {
      if (imageUrls.isNotEmpty) {
        for (var imageUrl in imageUrls) {
          await deleteImageFromStorage(imageUrl);
        }
      }
      await supabaseClient.from(DbStrings.blogsTable).delete().eq('id', id);
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<void> deleteImageFromStorage(String imageUrl) async {
    try {
      final path = extractPathFromUrl(imageUrl);
      await supabaseClient.storage.from(DbStrings.blogImagesStorage).remove([path]);
    } on StorageException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  String extractPathFromUrl(String url) {
    final uri = Uri.parse(url);
    final imageurl = uri.pathSegments.last;
    log(imageurl);
    return imageurl;
  }
}
