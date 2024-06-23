part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchAboutBlogsEvent extends SearchEvent {
  final String query;

  SearchAboutBlogsEvent(this.query);
}

final class ClearSearchEvent extends SearchEvent{}