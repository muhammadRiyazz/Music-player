part of 'mostplay_bloc.dart';

@freezed
class MostplayState with _$MostplayState {
  const factory MostplayState({
    required List<Musics> mostplayedlist,
  }) = _MostplayState;
  factory MostplayState.initioal() {
    Box<List> librarybox = getlibrarybox();
    List<Musics> mostsonglist = librarybox.get('most Played')!.toList().cast();
    return MostplayState(mostplayedlist: mostsonglist);
  }
}
