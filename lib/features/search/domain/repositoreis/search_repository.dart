import 'package:fpdart/fpdart.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/core/error/failures.dart';

abstract interface class SearchRepository {
  Future<Either<Failures, List<Blog>>> searchAboutBlog({required String query});
}
