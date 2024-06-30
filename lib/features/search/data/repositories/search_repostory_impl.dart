import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/network/connection_checker.dart';
import 'package:sgr_unity/features/app/function/check_app_local.dart';
import 'package:sgr_unity/features/search/data/datasources/search_remote_data_source.dart';
import 'package:sgr_unity/features/search/domain/repositoreis/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  final ConnectionChecker connectionChecker;
  SearchRepositoryImpl(this.searchRemoteDataSource, this.connectionChecker);
  @override
  Future<Either<Failures, List<Blog>>> searchAboutBlog(
      {required String query}) async {
    try {
      if (!(await connectionChecker.isConnected)) {
        return left(Failures(isArabic()? 'تفقد اتصالك بالأنترنت...' :'No internet, please check it'));
      }
      final blogs = await searchRemoteDataSource.searchAboutBlogs(query: query);
      return right(blogs);
    } on ServerException catch (e) {
      return left(Failures(e.message));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }
}
