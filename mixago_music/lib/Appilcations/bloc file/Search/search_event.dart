part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search({required String searchtext}) = Search;
  const factory SearchEvent.visiblesearch({
    required bool textfieldbool,
    required bool librarybool,
  }) = Visiblesearch;
}
