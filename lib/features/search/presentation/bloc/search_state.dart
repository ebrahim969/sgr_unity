part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<Blog> blogs;

  SearchSuccess(this.blogs);
}

final class SearchFailure extends SearchState {
  final String errMessage;

  SearchFailure(this.errMessage);
}
