import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgr_unity/core/common/entities/blog.dart';
import 'package:sgr_unity/features/search/domain/usecase/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final BlogsSearch _blogsSearch;
  SearchBloc({
    required BlogsSearch blogsSearch,
  })  : _blogsSearch = blogsSearch,
        super(SearchInitial()) {
    on<SearchAboutBlogsEvent>(_onSerachAboutBlogs);
    on<ClearSearchEvent>(_onClearSearchBlogs);
  }

  void _onSerachAboutBlogs(
      SearchAboutBlogsEvent event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final res = await _blogsSearch(BlogsSearchParams(query: event.query));
    res.fold((failure) {
      emit(SearchFailure(failure.message));
    }, (blogs) {
      emit(SearchSuccess(blogs));
    });
  }

  void _onClearSearchBlogs(ClearSearchEvent event, Emitter<SearchState> emit) {
    emit(SearchSuccess(const []));
  }
}
