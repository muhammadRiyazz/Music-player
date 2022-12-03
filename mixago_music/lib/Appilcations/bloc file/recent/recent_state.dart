part of 'recent_bloc.dart';

@freezed
class RecentState with _$RecentState {
  const factory RecentState({
    required List<Musics> recentsonglist,
  }) = _RecentState;
  factory RecentState.initial() {
    Box<List> librarybox = getlibrarybox();
    final List<Musics> recentSongsList =
        librarybox.get('recent Played')!.toList().cast<Musics>();

    return RecentState(recentsonglist: recentSongsList);
  }
}
