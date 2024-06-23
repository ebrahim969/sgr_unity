import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/blog/data/datasources/user_saved_blogs_remote_data_source.dart';
import 'package:sgr_unity/features/blog/data/models/saved_blog_model.dart';
import 'package:sgr_unity/features/blog/domain/entities/saved_blog_entity.dart';
import 'package:sgr_unity/features/blog/domain/repositories/user_saved_blogs_repository.dart';

class UserSavedBlogsRepositoryImpl implements UserSavedBlogsRepository {
  final UserSavedBlogsRemoteDataSource userSavedBlogsRemoteDataSource;
  final ConnectionChecker connectionChecker;

  UserSavedBlogsRepositoryImpl(
      this.userSavedBlogsRemoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failures, List<String>>> fetchUserSavedBlogsId(
      {required String userId}) async {
    try {
      List<String> fetchUserSavedBlogs = await fetchUserBlogsIdMethod(userId);
      return right(fetchUserSavedBlogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  Future<List<String>> fetchUserBlogsIdMethod(String userId) async {
    final fetchUserSavedBlogs = await userSavedBlogsRemoteDataSource
        .fetchsavedUserBlogsId(userId: userId);
    return fetchUserSavedBlogs;
  }

  @override
  Future<Either<Failures, SavedBlog>> toggleSavedUserBlogs(
      {required String userId, required String blogId}) async {
    try {
      SavedBlogsModel savedBlogsModel =
          SavedBlogsModel(userId: userId, blogId: blogId);
      List<String> fetchUserSavedBlogs = await fetchUserBlogsIdMethod(userId);
      for (var savedBlogId in fetchUserSavedBlogs) {
        if (savedBlogId == blogId) {
          await userSavedBlogsRemoteDataSource.deleteSavedUserBlog(
              blogId: blogId);
          return right(SavedBlogsModel(userId: userId, blogId: blogId));
        }
      }
      final savedUserBlogs =
          await userSavedBlogsRemoteDataSource.saveUserBlog(savedBlogsModel);
      return right(savedUserBlogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, List<Blog>>> getSavedBlogs(
      {required String userId}) async {
    try {
      List<String> blogsId = await fetchUserBlogsIdMethod(userId);
      final getSavedBlogs =
          await userSavedBlogsRemoteDataSource.getSavedBlogs(blogsId: blogsId);
      return right(getSavedBlogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    }
  }
}
