import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/core/usecase/usecase.dart';
import 'package:sgr_unity/features/search/domain/repositoreis/search_repository.dart';

class BlogsSearch implements UseCase<List<Blog>, BlogsSearchParams> {
  final SearchRepository searchRepository;

  BlogsSearch(this.searchRepository);
  @override
  Future<Either<Failures, List<Blog>>> call(BlogsSearchParams params) async {
    return await searchRepository.searchAboutBlog(query: params.query);
  }
}

class BlogsSearchParams {
  final String query;

  BlogsSearchParams({required this.query});
}
