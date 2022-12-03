part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<Musics> songlist,
  }) = _SearchState;

  factory SearchState.initial() {
    final Box<Musics> musicsBox = getsongsmodalbox();
    final List<Musics> allsongs = musicsBox.values.toList();

    return SearchState(
      songlist: allsongs,
    );
  }
}
